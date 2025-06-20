import 'package:flutter/material.dart';

import '../constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.6),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: mediaQueryHeight * 0.10,
                alignment: Alignment.topLeft,
                child: FittedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50,
                    ),
                  ),
                ),
              ),
              Container(
                height: mediaQueryHeight * 0.17,
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Container(
                height: mediaQueryHeight * 0.06,
                child: FittedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    child: Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
