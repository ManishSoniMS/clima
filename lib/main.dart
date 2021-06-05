import 'package:flutter/material.dart';
import 'package:clima_a_weather_app/screen/loading_screen.dart';

void main() {
  runApp(Clima());
}

class Clima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
