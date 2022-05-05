import 'dart:ffi';

import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String? hint;
  final ValueChanged<String?>? onSave;
  final FormFieldValidator<String?>? validator;

  const CustomTextFormField({
    Key? key,
    required this.text,
    this.hint,
    this.onSave,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          decoration:  InputDecoration(
            hintText:hint ,
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
          onSaved: onSave,
          validator:validator ,
        ),
      ],
    );
  }
}
