import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/core/view_model/control_view_model.dart';
import 'package:get/get.dart';

import '../core/view_model/cart_view_model.dart';
import '../core/view_model/home_view_model.dart';
import '../core/view_model/profile_view_model.dart';
import 'local_storage_data.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.put(ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() =>LocalStorageData());
    Get.lazyPut(() =>CartViewModel());
    Get.put(ProfileViewModel());
  }

}