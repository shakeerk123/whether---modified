import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  RxString city = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getLocationAndAddress();
  }

  void getLocationAndAddress() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get the latitude and longitude
      double lat = position.latitude;
      double lon = position.longitude;

      getAddress(lat, lon);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void getAddress(double lat, double lon) async {
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
      Placemark place = placemark[0];
      city.value = '${place.locality!},${place.country}' ;
    } catch (e) {
      print('Error getting address: $e');
    }
  }
}
