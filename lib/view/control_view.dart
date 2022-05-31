import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/control_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentWidget,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/images/Icon_Explore.png',
                fit: BoxFit.contain,
              ),
            ),
            label: '',
            activeIcon: const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Text('Explore'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/images/Group.png',
                fit: BoxFit.contain,
              ),
            ),
            label: '',
            activeIcon: const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Text('Cart'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/images/Icon_User.png',
                fit: BoxFit.contain,
              ),
            ),
            label: '',
            activeIcon: const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Text('Account'),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (value) {
          controller.changeSelectedValue(value);
        },
        elevation: 0.0,
        selectedItemColor: Colors.green,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
