import 'dart:io';
import 'package:demo_app/component/constants/constants.dart';
import 'package:demo_app/presentation/widgets/build_text_field_phone.dart';
import 'package:demo_app/shared/local/cache_helper/cache_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitialState());

  String verificationId;
  UserCredential userCredential;
  Future<void> phoneNumberSubmitted({String phoneNumber}) async {
    emit(PhoneAuthLoadingState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 30),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    await signIn(phoneAuthCredential);
  }

  void verificationFailed(FirebaseAuthException error) async {
    emit(PhoneAuthErrorState(error: error.toString()));
  }

  void codeSent(String verificationId, int resendToken) {
    this.verificationId = verificationId;
    emit(PhoneNumberSubmittedState());
  }

  void smsCodeSubmitted(String otpCode) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: otpCode);
    await signIn(phoneAuthCredential);
  }

  /// Method SignIn With Phone Number
  Future<void> signIn(PhoneAuthCredential phoneAuthCredential) async {
    try {
      userCredential =
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      emit(PhoneNumberVerifyState());
    } catch (error) {
      emit(PhoneAuthErrorState(error: error.toString()));
    }
  }

  /// Profile_ImagePicker
  File profileImage;
  ImagePicker pickerProfile = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile =
        await pickerProfile.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePickerSuccessState());
    } else {
      print('No Image Selected ..');
    }
  }

  /// Method Upload User Data
  void uploadUserData({
    @required String name,
    @required String email,
  }) {
    emit(PhoneAuthLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('Users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((image) {
      image.ref.getDownloadURL().then((imageUrl) {
        createNewUser(
          uId: userCredential.user.uid,
          name: name,
          email: email,
          image: imageUrl,
        );
      }).catchError((error) {
        emit(PhoneAuthErrorState(error: error.toString()));
      });
    }).catchError((error) {
      emit(PhoneAuthErrorState(error: error.toString()));
    });
  }

  /// Method Create User Data To FirebaseFireStore
  void createNewUser({
    @required String uId,
    @required String name,
    @required String email,
    @required String image,
  }) {
    UserModel userModel = UserModel(
      uid: uId,
      name: name,
      email: email,
      image: image,
      phoneNumber: phoneNumber,
    );
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .set(userModel.toMap())
        .then((user) {
      emit(CreateNewUserSuccessState(userCredential.user.uid));
    }).catchError((error) {
      emit(PhoneAuthErrorState(error: error.toString()));
    });
  }

  /// Method Get User Data From FirebaseFireStore

  UserModel userModel;
  void getUserData() async {
    emit(PhoneAuthLoadingState());
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get()
        .then((user) {
      userModel = UserModel.fromJson(user.data());
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print('Error is ' + error.toString());
      emit(PhoneAuthErrorState(error: error.toString()));
    });
  }

  /// Method LogOut
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    CacheHelper.removeData(key: 'uid');
  }
}
