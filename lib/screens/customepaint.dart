import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var green = Paint()
      ..color =Colors.blue.shade200
      ..maskFilter = MaskFilter.blur(
          BlurStyle.normal, 150.0
      )
      ..strokeWidth = 30;

    Offset topLeft = Offset(size.width , size.height / 3);

    canvas.drawCircle(topLeft, 250, green);

    var bottomRight = Paint()
      ..color =  Colors.teal.shade200
      ..style=PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(
          BlurStyle.normal, 150.0
      )
      ..strokeWidth = 15;
    Offset center = Offset(0, size.height*.8);

    canvas.drawCircle(center, 250, bottomRight);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}