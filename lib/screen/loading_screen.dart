import 'dart:developer';

import 'package:clima/controllers/location_controller.dart';
import 'package:clima/providers/location_provider.dart';
import 'package:clima/screen/no_permission_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  void didChangeDependencies() {
    // ref.watch(locationControllerProvider.notifier).getLocation();

    super.didChangeDependencies();
  }

  void listenDataController(WidgetRef ref) {
    ref.listen(locationControllerProvider, (previous, current) {
      current.mapOrNull(
        loading: (_) {
          log('Loading: Loading state');
        },
        data: (data){
          log('Loading: Loaded state : ${data}');
        },
        // => Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => LocationScreen()),
        // ),
        error: (error) {
          log('');
        },
        // => Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => NoPermissionScreen()),
        // ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // listenDataController(ref);
    return Scaffold(
      body: Center(child: SpinKitDoubleBounce(color: Colors.white, size: 50.0)),
    );
  }
}
