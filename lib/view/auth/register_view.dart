import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:ecommerce_app/view/widget/custom_button.dart';
import 'package:ecommerce_app/view/widget/custom_text.dart';
import 'package:ecommerce_app/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.to(LoginView());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomText(
                  text: 'Sign Up',
                  color: primaryColor,
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Name',
                  hint: 'Mohamed',
                  onSave: (value) {
                    controller.name = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'mm.ahmed@gmail.com',
                  onSave: (value) {
                    controller.email = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
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
                    controller.password = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
