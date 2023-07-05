import 'package:emart_app/constants/constants.dart';
import 'package:flutter/material.dart';

Widget backgroundWidget({required Widget child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgBackground),
        fit: BoxFit.fill,
      ),
    ),
    child: child,
  );
}
