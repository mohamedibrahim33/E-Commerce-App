import 'package:ecommerce_app/core/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTileWidget extends StatelessWidget {
  final ProfileViewModel profileViewModel=Get.find();
  final String image;
  final String title;
  final IconData icon;
  final bool? signOut;

   ListTileWidget({
    Key? key,
    this.signOut,
    required this.image,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if(signOut!=null) {
          profileViewModel.signOut();
        }},
      child: ListTile(
        leading: Image.asset(image),
        title: Text(title),
        trailing: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
