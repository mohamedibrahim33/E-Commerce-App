// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/services/firestore_user.dart';
import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();
   String? email, password, name;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser!=null){
      getCurrentUserData(_auth.currentUser!.uid);
    }
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
        await _auth.signInWithCredential(credential).then((value){
          saveUser(value);
        });

  }

  void signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
          await _auth.signInWithCredential(credential).then((value){
            saveUser(value);
          });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email!, password: password!)
          .then((value)async{
        getCurrentUserData(value.user!.uid);
      });
    } catch (e) {
      Get.snackbar(
        'Error Login Account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() {
    _auth
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
          saveUser(value);
    }).catchError((e) {
      Get.snackbar(
        'Error Sign up',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  void saveUser(UserCredential user) async {
    UserModel userModel=UserModel(
      name: name??user.user!.displayName,
      email: user.user!.email,
      uId: user.user!.uid,
      photo: '',
    );
    await FireStoreUser().addUserToFireStore(
    userModel);
    setUserToSharedPreference(userModel);
  }

  void getCurrentUserData(String uid)async{
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUserToSharedPreference(
          UserModel.fromJson(value.data() as Map<String, dynamic>));
    });
        }

  void setUserToSharedPreference(UserModel userModel)async{
    await localStorageData.setUser(userModel);
    Get.offAll(ControlView());
  }
}
