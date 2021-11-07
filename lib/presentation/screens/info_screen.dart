import 'package:demo_app/component/constants/constants.dart';
import 'package:demo_app/shared/local/cache_helper/cache_helper.dart';
import '../../style/color/color.dart';
import '../widgets/build_intro_text.dart';
import '../widgets/build_loading.dart';
import '../../style/icon/icon_broken.dart';
import '../../business_logic/phone_auth/phone_auth_cubit.dart';
import '../../business_logic/phone_auth/phone_auth_state.dart';
import '../widgets/build_button.dart';
import '../widgets/build_image_picker.dart';
import '../widgets/build_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class InfoScreen extends StatelessWidget {
  String name, email;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PhoneAuthCubit>(context);
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is PhoneAuthLoadingState) {
          showProgressIndicator(context);
        }
        if (state is CreateNewUserSuccessState) {
          CacheHelper.saveData(key: 'uid', value: state.uid).then((value) {
            Navigator.pushNamedAndRemoveUntil(context, Map, (route) => false);
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Done Successfully'),
              backgroundColor: green,
              duration: Duration(seconds: 4),
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildIntroText(
                  headerText: 'What about you?',
                  subText:
                      'Please enter your required data to verify\nyour account.',
                ),
                SizedBox(height: 30),
                buildImagePicker(
                  image: cubit.profileImage == null
                      ? AssetImage('')
                      : FileImage(cubit.profileImage),
                  onPressed: () {
                    cubit.getProfileImage();
                  },
                ),
                SizedBox(height: 20),
                buildTextForm(
                  labelText: 'Name',
                  controller: nameController,
                  type: TextInputType.name,
                  prefixIcon: IconBroken.Profile,
                  validator: (String value) {
                    if (value.isEmpty || value == '' || value == null) {
                      return 'Please enter your name!!';
                    }
                  },
                  onSaved: (String value) {
                    name = value;
                  },
                ),
                SizedBox(height: 10),
                buildTextForm(
                  labelText: 'Email Address',
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  prefixIcon: IconBroken.Message,
                  validator: (String value) {
                    if (value.isEmpty || value == '' || value == null) {
                      return 'Please enter your email address!!';
                    }
                  },
                  onSaved: (String value) {
                    email = value;
                  },
                ),
                Spacer(),
                buildTextButton(
                  context,
                  text: 'DONE',
                  width: MediaQuery.of(context).size.width,
                  onPressed: () => buildSetUpUserAccount(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void buildSetUpUserAccount(context) async {
    if (!formKey.currentState.validate()) {
    } else {
      formKey.currentState.save();
      BlocProvider.of<PhoneAuthCubit>(context).uploadUserData(
        name: nameController.text,
        email: emailController.text,
      );
    }
  }
}
