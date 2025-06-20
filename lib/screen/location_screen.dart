import 'package:flutter/material.dart';

import '../constants.dart';
import '../services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  // final locationWeather;
  // LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String weatherMessage;
  late String cityName;

  @override
  void initState() {
    super.initState();
    updateUI(null);
  }

  void updateUI(dynamic weatherAPIData) {
    setState(() {
      if (weatherAPIData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      temperature = weatherAPIData["main"]["temp"].toInt();
      int condition = weatherAPIData["weather"][0]["id"];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherAPIData["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.6),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: mediaQueryHeight * 0.10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      child: ElevatedButton(
                        onPressed: () async {
                          var weatherData = weather.getLocationWeather();
                          updateUI(weatherData);
                        },
                        child: Icon(Icons.near_me, size: 50.0),
                      ),
                    ),
                    FittedBox(
                      child: ElevatedButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CityScreen();
                              },
                            ),
                          );
                          if (typedName != null) {}
                          var weatherData = await weather.getCityWeather(
                            typedName,
                          );
                          updateUI(weatherData);
                        },
                        child: Icon(Icons.location_city, size: 50.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: mediaQueryHeight * 0.2,
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    FittedBox(
                      child: Text(
                        '$temperature° ',
                        style: kTemperatureTextStyle,
                      ),
                    ),
                    FittedBox(
                      child: Text('$weatherIcon', style: kConditionTextStyle),
                    ),
                  ],
                ),
              ),
              Container(
                height: mediaQueryHeight * 0.30,
                padding: const EdgeInsets.all(15.0),
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "$weatherMessage",
                        style: kMessageTextStyle,
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        " in $cityName!",
                        style: kMessageTextStyle,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
