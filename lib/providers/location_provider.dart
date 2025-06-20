import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

class LocationRepository {
  Future<void> checkPermission() async {
    log("location provider: step 2");
    final permission = await Geolocator.checkPermission();
    log("location provider: step 3");
    if (permission == LocationPermission.denied) {
      log("location provider: step 4");
      await requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      log("location provider: step 8");
      throw Exception(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
  }

  Future<void> requestPermission() async {
    log("location provider: step 1");
    final permission = await Geolocator.requestPermission();
    log("location provider: step 5");
    if (permission == LocationPermission.denied) {
      log("location provider: step 6");
      throw Exception('Location permissions are denied');
    } else if (permission == LocationPermission.deniedForever) {
      log("location provider: step 7");
      throw Exception(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
  }

  Future<Position> getCurrentLocation() async {
    log("location provider: step 1");
    await checkPermission();
    log("location provider: step 9");
    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.low),
    );
  }
}

@riverpod
LocationRepository locationRepository(Ref ref) {
  return LocationRepository();
}

@riverpod
Future<Position> getCurrentLocation(Ref ref) async {
  final repository = ref.watch(locationRepositoryProvider);
  return await repository.getCurrentLocation();
}
