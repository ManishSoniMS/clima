import 'package:geolocator/geolocator.dart';

class Location {
  late double lat;
  late double long;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      long = position.longitude;
      print(position);
    } catch (error) {
      print(error);
    }
  }
}
