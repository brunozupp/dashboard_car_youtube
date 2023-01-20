import 'package:dashboard_car_youtube/constants.dart';
import 'package:flutter/material.dart';

class SpeedLinePrinter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 8;

    Paint paintTop = Paint()
      ..style = PaintingStyle.fill
      ..color = primaryColor;
      // ..shader = ui.Gradient.linear(
      //   Offset(0,0),
      //   Offset(size.width, size.height), 
      //   [
      //     primaryColor,
      //     Color(0xFF7D7472).withOpacity(0.8),
      //   ]
      // );

    Path pathTop = Path()
      ..moveTo(size.width * 0.78, 0)
      ..lineTo(size.width, size.height * 0.3)
      ..lineTo(size.width - strokeWidth, size.height * 0.3)
      ..close();


    Path pathBottom = Path()
      ..moveTo(size.width, size.height * 0.3)
      ..lineTo(40, size.height - 20)
      ..lineTo(size.width - strokeWidth, size.height * 0.3)
      ..close();

    canvas.drawPath(pathTop, paintTop);
    canvas.drawPath(pathBottom, paintTop);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
