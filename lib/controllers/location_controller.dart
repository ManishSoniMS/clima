

import '/providers/location_provider.dart';
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

  Future<void> checkLocationPermission() async {
    state = AsyncLoading();
    try {
      state = await AsyncValue.guard(() async {
        final dataRepository = ref.read(locationRepositoryProvider);
        await dataRepository.checkPermission();
      });
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }

  Future<void> getCurrentLocation() async {
    state = AsyncLoading();
    try {
      final dataRepository = ref.read(locationRepositoryProvider);
      final location = await dataRepository.getCurrentLocation();

      state = AsyncValue<Position>.data(location);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }
}
