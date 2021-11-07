import '../../component/constants/constants.dart';
import '../screens/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Sixth Step
Future<void> goToMyCurrentLocation() async {
  final GoogleMapController _controller = await mapController.future;
  _controller.animateCamera(
      CameraUpdate.newCameraPosition(myCurrentLocationCameraPosition));
}
