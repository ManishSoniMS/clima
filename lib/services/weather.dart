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

}
