import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/auth/register_view.dart';
import 'package:ecommerce_app/view/widget/custom_button.dart';
import 'package:ecommerce_app/view/widget/custom_text.dart';
import 'package:ecommerce_app/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_button_socail.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            right: 20,
            left: 20,
          ),
          child: Form(
            key:_formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'Welcome,',
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterView());
                      },
                      child: const CustomText(
                        text: 'Sign UP',
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'mm.ahmed@gmail.com',
                  onSave: (value) {
                    controller.email=value!;
                  },
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please enter your email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: 'password',
                  hint: '********',
                  onSave: (value) {
                    controller.password=value!;
                  },
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'Forgot Password?',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Sign In',
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                CustomButtonSocial(
                  text: 'Sign In With Facebook',
                  imageName: 'assets/images/facebook.png',
                  onPressed: (){
                    controller.signInWithFacebook();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  text: 'Sign In With Google',
                  imageName: 'assets/images/google.png',
                  onPressed: (){
                    controller.googleSignInMethod();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
