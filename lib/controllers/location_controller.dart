import 'dart:developer';

import 'package:clima/providers/location_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  Position? _position;

  @override
  Future<void> build() async {
    return null;
  }

  set setPosition(Position? value) {
    _position = value;
  }

  Position? get position => _position;

  Future<void> getLocation() async {
    log('Location: get location method called');
    state = AsyncLoading();
    try {
      // state = await AsyncValue<Position>.data(() async {
      final dataRepository = ref.read(locationRepositoryProvider);
      final location = await dataRepository.getCurrentLocation();
      log('Location: ${location.latitude}, ${location.longitude}');
      // });
      state = AsyncValue<Position>.data(location);
    } catch (e) {
      log('Location: Error : $e');
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }
}
