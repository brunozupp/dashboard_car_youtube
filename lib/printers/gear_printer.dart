import 'package:dashboard_car_youtube/constants.dart';
import 'package:flutter/material.dart';

class GearPrinter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    
    Paint paint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    const double strokeWidth = 2; 

    Path leftPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.17, size.height * 0.5)
      ..lineTo(size.width * 0.34, size.height * 0.5)
      ..lineTo(size.width * 0.42, 0)
      ..lineTo(size.width * 0.48, 0)
      ..lineTo(size.width * 0.48, strokeWidth)
      ..lineTo(size.width * 0.42, strokeWidth)
      ..lineTo(size.width * 0.34, size.height * 0.5 + strokeWidth)
      ..lineTo(size.width * 0.17, size.height * 0.5 + strokeWidth)
      ..close();

    canvas.drawPath(leftPath, paint);

    Path rightPath = Path()
      ..moveTo(size.width * 0.52, 0)
      ..lineTo(size.width * 0.58, 0)
      ..lineTo(size.width * 0.66, size.height * 0.5)
      ..lineTo(size.width * 0.83, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.83, size.height * 0.5 + strokeWidth)
      ..lineTo(size.width * 0.66, size.height * 0.5 + strokeWidth)
      ..lineTo(size.width * 0.58, strokeWidth)
      ..lineTo(size.width * 0.52, strokeWidth)
      ..close();

    canvas.drawPath(rightPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}