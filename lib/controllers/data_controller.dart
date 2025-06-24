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
}
