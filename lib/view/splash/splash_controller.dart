import 'package:feed_me/config/constants.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  late List<Placemark> placemarks;

  late Position position;

  @override
  Future<void> onInit() async {
    super.onInit();
    _getLocation();
  }

  Future<void> _getLocation() async {
    Position position = await _determinePosition();
    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Get.toNamed(kRouteHome,
        arguments: {'location': placemarks.first.subLocality ?? ''});
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
