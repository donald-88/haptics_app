import 'package:flutter/material.dart';

class PitchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Paint paintFill = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Paint zones = Paint()
      ..color = const Color.fromARGB(255, 107, 165, 57)
      ..style = PaintingStyle.fill;

    for (double zone = 0; zone <= size.width.toDouble();) {
      if (zone % 100 == 0) {
        canvas.drawRect(
            Rect.fromPoints(
                Offset(0, zone + 100), Offset(size.width, zone + 50)),
            zones);
      }
      ++zone;
    }

    canvas.drawLine(
        Offset(20, centerY), Offset(size.width - 20, centerY), paint);
    canvas.drawRect(
        Rect.fromPoints(
            const Offset(20, 20), Offset(size.width - 20, size.height - 20)),
        paint);
    canvas.drawRect(
        Rect.fromPoints(Offset(centerX - 50, 20), Offset(centerX + 50, 70)),
        paint);
    canvas.drawRect(
        Rect.fromPoints(Offset(centerX - 50, size.height - 20),
            Offset(centerX + 50, size.height - 70)),
        paint);
    canvas.drawCircle(Offset(centerX, centerY), 100, paint);
    canvas.drawCircle(Offset(centerX, centerY), 5, paintFill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
