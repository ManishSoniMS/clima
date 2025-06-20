import 'package:geolocator/geolocator.dart';

class Location {
  late double lat;
  late double long;

  Future<void> getPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      lat = position.latitude;
      long = position.longitude;
      print(position);
    } catch (error) {
      print(error);
    }
  }
}
