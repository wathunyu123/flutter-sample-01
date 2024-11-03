import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension StringExtensions on String {
  Widget svgToIcon({
    double width = 30.0,
    double height = 30.0,
  }) {
    return SvgPicture.string(
      this,
      width: width,
      height: height,
    );
  }
}
