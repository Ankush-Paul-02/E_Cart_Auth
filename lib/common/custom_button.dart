import 'package:emart_app/constants/constants.dart';
import 'package:flutter/material.dart';

Widget customELevatedButton({
  onPress,
  color,
  textColor,
  required String title,
}) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(12),
    ),
    child: title.text.color(textColor).fontFamily(bold).make(),
  );
}
