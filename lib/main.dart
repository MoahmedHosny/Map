import 'package:demo_app/business_logic/phone_auth/phone_auth_state.dart';
import 'package:demo_app/component/constants/constants.dart';
import 'package:demo_app/presentation/widgets/build_text_field_phone.dart';
import 'package:demo_app/shared/local/cache_helper/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/phone_auth/phone_auth_cubit.dart';
import 'presentation/screens/info_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/map_screen.dart';
import 'presentation/screens/otp_screen.dart';
import 'style/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  /// This Method Is {Responsible => مسئولة} For {Arranging => ترتيب} {Tasks => المهام} In The App
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: transparent,
    ),
  );
  Widget startWidget;
  uid = CacheHelper.getData(key: 'uid');
  if (uid != null) {
    startWidget = MapScreen();
  } else {
    startWidget = LoginScreen();
  }
  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp(this.startWidget);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneAuthCubit()..getUserData(),
      child: BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: white,
            fontFamily: 'jannah',
          ),
          home: startWidget,
          routes: {
            // Splash: (context) => SplashScreen(),
            Login: (context) => LoginScreen(),
            Otp: (context) => OtpScreen(phoneNumber: phoneNumber),
            Info: (context) => InfoScreen(),
            Map: (context) => MapScreen(),
          },
        ),
      ),
    );
  }
}
