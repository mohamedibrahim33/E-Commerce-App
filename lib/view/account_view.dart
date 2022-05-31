import 'package:ecommerce_app/core/view_model/profile_view_model.dart';
import 'package:ecommerce_app/view/widget/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/custom_text.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ProfileViewModel>(
            init: ProfileViewModel(),
            builder: (controller) => Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: controller.userModel == null
                                    ? const AssetImage(
                                        'assets/images/avatar.png')
                                    : controller.userModel!.photo == "default"
                                        ? const AssetImage(
                                            'assets/images/avatar.png')
                                        : NetworkImage(
                                                controller.userModel!.photo!)
                                            as ImageProvider,
                              ),
                            ),
                          ),
                          Column(
                            children: [
//                              MaterialButton(onPressed: (){
//                                controller.signOut();
//                              },child: const Text('sign out'),),
                              CustomText(
                                text: controller.userModel!.name!,
                              ),
                              CustomText(
                                text: controller.userModel!.email!,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       ListTileWidget(
                        image: 'assets/images/icons/Icon_Edit-Profile.png',
                        icon: Icons.navigate_next,
                        title: 'Edit Profile',
                      ),
                       ListTileWidget(
                        image: 'assets/images/icons/Icon_Location.png',
                        icon: Icons.navigate_next,
                        title: 'Shipping Address',
                      ),
                       ListTileWidget(
                        image: 'assets/images/icons/Icon_History.png',
                        icon: Icons.navigate_next,
                        title: 'Order History',
                      ),
                       ListTileWidget(
                        image: 'assets/images/icons/Icon_Payment.png',
                        icon: Icons.navigate_next,
                        title: 'Cards',
                      ),
                       ListTileWidget(
                        image: 'assets/images/icons/Icon_Alert.png',
                        icon: Icons.navigate_next,
                        title: 'Notifications',
                      ),
                       ListTileWidget(
                        image: 'assets/images/icons/Icon_Exit.png',
                        icon: Icons.navigate_next,
                        title: 'Log Out',
                        signOut: true,
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
