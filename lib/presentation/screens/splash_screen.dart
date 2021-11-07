// import 'dart:async';
// import 'package:demo_app/component/constants/constants.dart';
// import 'package:demo_app/presentation/screens/login_screen.dart';
// import 'package:demo_app/presentation/screens/map_screen.dart';
// import 'package:demo_app/shared/local/cache_helper/cache_helper.dart';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreen createState() => _SplashScreen();
// }
//
// class _SplashScreen extends State<SplashScreen> {
//   void initState() {
//     super.initState();
//     verifyUserLogin();
//     startTimer();
//   }
//
//   Widget startWidget;
//   void verifyUserLogin() async {
//     uId = CacheHelper.getData(key: 'uId');
//     if (uId != null) {
//       startWidget = MapScreen();
//     } else {
//       startWidget = LoginScreen();
//     }
//   }
//
//   startTimer() async {
//     var duration = Duration(seconds: 4);
//     Timer(duration, route);
//   }
//
//   route() {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => startWidget));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset(
//           'assets/images/map.png',
//           height: MediaQuery.of(context).size.height * 0.22,
//           width: MediaQuery.of(context).size.width,
//         ),
//       ),
//     );
//   }
// }