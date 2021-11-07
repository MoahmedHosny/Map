import '../../helper/location_helper.dart';
import '../widgets/build_drawer.dart';
import '../widgets/build_go_my_current_location.dart';
import '../widgets/build_map.dart';
import '../widgets/build_search_bar.dart';
import '../../style/color/color.dart';
import '../../style/icon/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Second Step
Position position;

/// Third Step
final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
  target: LatLng(position.latitude, position.longitude),
  bearing: 0,
  tilt: 0,
  zoom: 16,
);

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  /// Fourth Step
  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation()
        .whenComplete(() => setState(() {}));

    /// getLastKnownPosition => الجملة دي عبارة عن انه يجيب اخر موقع للمستخدم وقت ما كان الفون متصل بالانترنت
    // position = await Geolocator.getLastKnownPosition()
    //      .whenComplete(() => setState(() {}));
  }

  /// Seventh Step
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? buildMap()
              : Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF78A3EB),
                  ),
                ),
          buildFloatingSearchBar(context),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 15),
        child: FloatingActionButton(
          elevation: 0,
          highlightElevation: 0,
          backgroundColor: blue,
          onPressed: goToMyCurrentLocation,
          child: Icon(IconBroken.Location),
        ),
      ),
    );
  }
}
