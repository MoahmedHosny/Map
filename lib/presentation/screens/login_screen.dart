import 'package:demo_app/component/constants/constants.dart';

import '../../style/color/color.dart';

import '../widgets/build_intro_text.dart';

import '../../business_logic/phone_auth/phone_auth_cubit.dart';
import '../../business_logic/phone_auth/phone_auth_state.dart';
import '../widgets/build_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/build_button.dart';
import '../widgets/build_text_field_phone.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

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
        if (state is PhoneNumberSubmittedState) {
          Navigator.pushNamedAndRemoveUntil(context, Otp, (route) => false);
        }
        if (state is PhoneAuthErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: red,
              duration: Duration(seconds: 4),
            ),
          );
        }
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildIntroText(
                    headerText: 'What is your phone number?',
                    subText:
                        'Please enter your phone number to verify\nyour account.'),
                SizedBox(height: 120),
                buildPhoneTextField(),
                SizedBox(height: 60),
                buildTextButton(
                  context,
                  onPressed: () {
                    buildRegister(context);
                  },
                  text: 'NEXT',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget buildPhoneSubmittedBloc() {
  //   return BlocListener<PhoneAuthCubit, PhoneAuthState>(
  //     listenWhen: (previous, current) {
  //       return previous != current;
  //     },
  //     listener: (context, state) {
  //       if (state is PhoneAuthLoadingState) {
  //        showProgressIndicator(context);
  //       }
  //       if (state is PhoneNumberSubmittedState) {
  //         Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => OtpScreen(
  //                       phoneNumber: phoneNumber,
  //                     )));
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

  void buildRegister(context) {
    if (!formKey.currentState.validate()) {
    } else {
      formKey.currentState.save();
      BlocProvider.of<PhoneAuthCubit>(context)
          .phoneNumberSubmitted(phoneNumber: phoneNumber);
    }
  }
}
