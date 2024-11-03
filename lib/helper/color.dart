import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static final instance = AppColor._();

  Color transparent = Colors.transparent;
  Color white = Colors.white;
  Color grey = Colors.grey;
  Color red = Colors.red;
  Color green = Colors.green;
  Color blue = Colors.blue;
  Color yellow = Colors.yellow;

  Color darkBlack = const Color(0xFF000000);

  Color lightBlack = const Color(0xFF192028);
  Color lightOrange = const Color(0xFFFD5E3D);
  Color lightPink = const Color(0xFFC43990);
  Color lightRed = const Color(0xFFFDC5C5);

  Color deepPurple = Colors.deepPurple;
  Color deepBlue = const Color.fromARGB(255, 28, 118, 192);
}
