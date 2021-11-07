import 'package:flutter/material.dart';

abstract class PhoneAuthState {}

class PhoneAuthInitialState extends PhoneAuthState {}

/// Loading
class PhoneAuthLoadingState extends PhoneAuthState {}

/// Error
class PhoneAuthErrorState extends PhoneAuthState {
  final String error;
  PhoneAuthErrorState({@required this.error});
}

/// Button(Next)
class PhoneNumberSubmittedState extends PhoneAuthState {}

/// Button(Verify)
class PhoneNumberVerifyState extends PhoneAuthState {}

/// Profile image Picker
class ProfileImagePickerSuccessState extends PhoneAuthState {}

/// Create New User
class CreateNewUserSuccessState extends PhoneAuthState {
  final String uid;

  CreateNewUserSuccessState(this.uid);
}

/// Get User Data
class GetUserDataSuccessState extends PhoneAuthState {}
