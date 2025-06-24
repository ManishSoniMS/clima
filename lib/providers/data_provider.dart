import 'package:clima_a_weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_provider.g.dart';

String apiID = '58c4702650a20d64c52d4127718ab1d0';
String weatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class DataRepository {
  Future<WeatherModel> getWeather(double lat, double long) async {
    final uri = '$weatherURL?lat=$lat&lon=$long&appid=$apiID&units=metric';

    final res = await Dio().get(uri);
    return WeatherModel.fromMap(res.data);
  }
}

@riverpod
DataRepository dataRepository(Ref ref) {
  return DataRepository();
}
