import 'package:emart_app/constants/constants.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  required String title,
  required String hint,
  controller,
  isObscure,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}
