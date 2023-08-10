import 'package:flutter/material.dart';
import 'package:proyek/utils/colors_utils.dart';

class BackgrounLoginShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = colorprimary
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.3804769);
    path0.cubicTo(
        size.width * 0.2639250,
        size.height * 0.4513538,
        size.width * 0.6867500,
        size.height * 0.1563846,
        size.width,
        size.height * 0.2318154);
    path0.quadraticBezierTo(
        size.width, size.height * 0.4238615, size.width, size.height);
    path0.lineTo(0, size.height);
    path0.quadraticBezierTo(
        0, size.height * 0.8451192, 0, size.height * 0.3804769);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
