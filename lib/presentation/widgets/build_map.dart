import '../../component/constants/constants.dart';
import '../screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Fifth Step
Widget buildMap() {
  return GoogleMap(
    mapType: MapType.normal,
    myLocationEnabled: true,
    myLocationButtonEnabled: false,
    zoomControlsEnabled: false,
    initialCameraPosition: myCurrentLocationCameraPosition,
    onMapCreated: (GoogleMapController googleMapController) {
      mapController.complete(googleMapController);
    },
  );
}
