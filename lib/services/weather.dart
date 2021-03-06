import 'package:clima_a_weather_app/services/location.dart';
import 'package:clima_a_weather_app/services/networking.dart';

String apiID = '58c4702650a20d64c52d4127718ab1d0';
String weatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networking =
        NetworkHelper('$weatherURL?q=$cityName&appid=$apiID&units=metric');
    var weatherData = networking.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location locationData = Location();
    await locationData.getCurrentLocation();
    NetworkHelper networking = NetworkHelper(
        '$weatherURL?lat=${locationData.lat}&lon=${locationData.long}&appid=$apiID&units=metric');
    var weatherData = networking.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts '
          'and ๐';
    } else if (temp < 10) {
      return 'You\'ll need'
          ' ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ '
          'just in case';
    }
  }
}
