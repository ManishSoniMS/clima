import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

class LocationRepository {
  Future<void> checkPermission() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
  }

  Future<void> requestPermission() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied');
    } else if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
  }

  Future<Position> getCurrentLocation() async {
    await checkPermission();
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
