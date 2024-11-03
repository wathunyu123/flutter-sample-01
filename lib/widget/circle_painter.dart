import 'package:flutter/cupertino.dart';

import '../helper/color.dart';

class CirclePainter extends CustomPainter {
  final double radius;
  final AppColor appColor;

  CirclePainter(this.radius, this.appColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          appColor.lightOrange,
          appColor.lightPink,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(
        Rect.fromCircle(
          center: const Offset(0, 0),
          radius: radius,
        ),
      );

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
