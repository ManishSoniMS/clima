import 'location.dart';
import 'networking.dart';

String apiID = '58c4702650a20d64c52d4127718ab1d0';
String weatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networking = NetworkHelper(
      '$weatherURL?q=$cityName&appid=$apiID&units=metric',
    );
    var weatherData = networking.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location locationData = Location();

    await locationData.getCurrentLocation();

    print(
      '$weatherURL?lat=${locationData.lat}&lon=${locationData.long}&appid=$apiID&units=metric',
    );
    NetworkHelper networking = NetworkHelper(
      '$weatherURL?lat=${locationData.lat}&lon=${locationData.long}&appid=$apiID&units=metric',
    );
    var weatherData = networking.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
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

  String getMessage(int temp) {
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
