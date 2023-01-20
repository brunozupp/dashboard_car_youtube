import 'package:dashboard_car_youtube/constants.dart';
import 'package:flutter/material.dart';

class OdoPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = primaryColor;

    double strokeWidth = 4;

    Path path = Path()
      ..lineTo(size.width * 0.73, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.72, strokeWidth)
      ..close();
  
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}