import 'package:clima_a_weather_app/models/weather_model.dart';
import 'package:clima_a_weather_app/utils/networking/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_provider.g.dart';

String apiID = '58c4702650a20d64c52d4127718ab1d0';
String weatherURL = 'https://api.openweathermap.org/data/2.5/weather';

abstract class DataRepository {
  Future<WeatherModel> getWeather(double lat, double long);
}

class DataRepositoryImpl implements DataRepository {
  DataRepositoryImpl(this._dio);

  final Dio _dio;

  Future<WeatherModel> getWeather(double lat, double long) async {
    final uri = '$weatherURL?lat=$lat&lon=$long&appid=$apiID&units=metric';

    final res = await _dio.get(uri);
    return WeatherModel.fromMap(res.data);
  }
}

@riverpod
DataRepository dataRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return DataRepositoryImpl(dio);
}
