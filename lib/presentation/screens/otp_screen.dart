import 'package:demo_app/component/constants/constants.dart';

import '../../business_logic/phone_auth/phone_auth_cubit.dart';
import '../../business_logic/phone_auth/phone_auth_state.dart';
import '../widgets/build_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/build_button.dart';
import '../widgets/build_text_otp.dart';
import '../widgets/build_pin_code.dart';
import '../../style/color/color.dart';
import 'package:flutter/material.dart';

String otpCode;

/// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  String phoneNumber;
  OtpScreen({@required this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is PhoneAuthLoadingState) {
          showProgressIndicator(context);
        }
        if (state is PhoneNumberVerifyState) {
          Navigator.pushNamedAndRemoveUntil(context, Info, (route) => false);
        }
        if (state is PhoneAuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 4),
          ));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildIntroTextOtp(),
              SizedBox(height: 120),
              buildPinCodeFields(context),
              SizedBox(height: 60),
              buildTextButton(
                context,
                onPressed: () {
                  showProgressIndicator(context);

                  buildLogin(context);
                },
                text: 'Verify',
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn’t recieve a verification code? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Resend code',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buildLogin(context) {
    BlocProvider.of<PhoneAuthCubit>(context).smsCodeSubmitted(otpCode);
  }
}
 // Widget buildPhoneVerificationBloc() {
  //   return BlocListener<PhoneAuthCubit, PhoneAuthState>(
  //     listenWhen: (previous, current) {
  //       return previous == current;
  //     },
  //     listener: (context, state) {
  //       if (state is PhoneAuthLoadingState) {

  //       }
  //       if (state is PhoneNumberVerifyState) {
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (_) => MapScreen()));
  //       }
  //       if (state is PhoneAuthErrorState) {
  //          Navigator.pop(context);
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text(state.error),
  //           backgroundColor: Colors.red,
  //           duration: Duration(seconds: 4),
  //         ));
  //       }
  //     },
  //     child: SizedBox(),
  //   );
  // }