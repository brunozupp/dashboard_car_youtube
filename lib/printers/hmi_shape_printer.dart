import 'package:dashboard_car_youtube/constants.dart';
import 'package:flutter/material.dart';

class HmiShapePrinter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    Path path = Path()
      ..moveTo(0, size.height / 2) // movendo o ponto da onde vai ser desenhado
      ..lineTo(size.width * 0.13, size.height * 0.05) // do ponto que vai ser desenhado até essas coordenadas setadas como prametros
      ..lineTo(size.width * 0.31, 0)
      ..lineTo(size.width * 0.39, size.height * 0.11)
      ..lineTo(size.width * 0.60, size.height * 0.11)
      ..lineTo(size.width * 0.69, size.height * 0)
      ..lineTo(size.width * 0.87, size.height * 0.05)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width * 0.87, size.height)
      ..lineTo(size.width * 0.13, size.height)
      ..close();

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..color = primaryColor;

      canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}