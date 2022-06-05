import 'dart:convert';

import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/auth/login_view.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUser();
      return userModel;
    } catch (e) {
      print( 'the error of LocalStorageData is ${e.toString()}');
      return null;
    }
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(cachedUserData, json.encode(userModel.toJson()));
  }

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value= prefs.getString(cachedUserData);
    return UserModel.fromJson(json.decode(value!));
  }

  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(LoginView());
  }
}
