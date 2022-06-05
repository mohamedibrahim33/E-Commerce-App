import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController{

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }
  final LocalStorageData  localStorageData= Get.find<LocalStorageData>();
  UserModel? _userModel;
  UserModel? get userModel=>_userModel;

  void getCurrentUser() {
    localStorageData.getUser.then((value){
      _userModel=value;
      print("tmam");
      print(value.toString());
      print(_userModel!.name);
      print(_userModel!.email);
    }).catchError((error){
      print('the error is $error');
    });
    update();
  }

  Future<void> signOut()async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}