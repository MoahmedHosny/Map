import 'package:geolocator/geolocator.dart';

/// First Step
class LocationHelper {
  static Future<Position> getCurrentLocation() async {
    bool isServicesEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServicesEnabled) {
      await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition(
      /// desiredAccuracy => دقة تحديد الموقع
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
