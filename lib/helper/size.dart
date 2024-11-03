import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get icon => MediaQuery.of(this).size.width * .25;

  double sizeIcon({
    double ratio = .25,
  }) {
    return width * ratio;
  }
}
