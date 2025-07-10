import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../controllers/data_controller.dart';
import '../controllers/location_controller.dart';
import '../gen/assets.gen.dart';

class LocationScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    print("init  is called !");
    if (!_isInitialized) {
      _isInitialized = true;
      Future.delayed(Duration(milliseconds: 300), () => setUp());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies  is called !");
  }

  Future<void> setUp() async {
    final locationNotifier = ref.read(locationControllerProvider.notifier);
    await locationNotifier.getCurrentLocation();

    final position = locationNotifier.position;

    if (position != null) {
      await ref
          .read(dataControllerProvider.notifier)
          .getWeather(position.latitude, position.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    final dataController = ref.watch(dataControllerProvider.notifier);
    final locationNotifier = ref.read(locationControllerProvider.notifier);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.locationBackground.path),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.6),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: ref
            .watch(dataControllerProvider)
            .when(
              data: (_) => SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: height * 0.10,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              // await locationNotifier.getCurrentLocation();
                              // final pos = locationNotifier.position;
                              // if (pos != null) {
                              //   await ref
                              //       .read(dataControllerProvider.notifier)
                              //       .getWeather(pos.latitude, pos.longitude);
                              // }
                            },
                            child: Icon(Icons.near_me, size: 40),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Navigate to CityScreen and get weather by city name
                            },
                            child: Icon(Icons.location_city, size: 40),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.2,
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${dataController.weather.main.temp}°',
                            style: kTemperatureTextStyle,
                          ),
                          SizedBox(width: 10),
                          Text(
                            dataController.getWeatherIcon,
                            style: kConditionTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.3,
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            dataController.getMessage,
                            style: kMessageTextStyle,
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            ' in ${dataController.weather.name}!',
                            style: kMessageTextStyle,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              error: (error, _) => Center(
                child: Text(
                  'Error: $error',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
      ),
    );
  }
}
