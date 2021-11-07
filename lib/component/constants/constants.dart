import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

/// Routes
const Splash = '/Splash';
const Login = '/Login';
const Otp = '/Otp';
const Info = '/Info';
const Map = '/Map';

/// Google Map
const apiKey = 'AIzaSyDDQxjHNghf9uuutBEP_hgPvlU9AjiEyEY';
final Completer<GoogleMapController> mapController = Completer();
final FloatingSearchBarController controller = FloatingSearchBarController();

/// User Uid
String uid = '';
