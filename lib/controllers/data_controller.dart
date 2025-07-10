import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/weather_model.dart';
import '../providers/data_provider.dart';

part 'data_controller.g.dart';

@riverpod
class DataController extends _$DataController {
  WeatherModel? _weatherModel;

  @override
  Future<void> build() async {
    return null;
  }

  WeatherModel get weather {
    if (_weatherModel == null) {
      throw Exception('Weather data not available. Please fetch it first.');
    }
    return _weatherModel!;
  }

  Future<void> getWeather(double lat, double long) async {
    print("get Weather is called with lat: $lat, long: $long");
    state = AsyncLoading();
    try {
      final dataRepository = ref.read(dataRepositoryProvider);
      state = await AsyncValue.guard(() async {
        final result = await dataRepository.getWeather(lat, long);

        _weatherModel = result;
      });
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }

  String get getWeatherIcon {
    final condition = _weatherModel?.weather.first.id ?? 0;
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String get getMessage {
    final temp = _weatherModel?.main.temp ?? 0;
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts '
          'and 👕';
    } else if (temp < 10) {
      return 'You\'ll need'
          ' 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 '
          'just in case';
    }
  }
}
