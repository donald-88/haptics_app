import 'package:flutter/material.dart';

class LinkPainter extends ChangeNotifier implements CustomPainter {
  List<Offset> linkPts = [];

  @override
  bool hitTest(Offset position) => true;

  void startStroke(Offset position) {
    linkPts.add(position);
    notifyListeners();
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    if (linkPts.length > 1) {
      Path path = Path()
        ..moveTo(0, 2)
        ..lineTo(100, 100);

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;

  @override
  // TODO: implement semanticsBuilder
  SemanticsBuilderCallback? get semanticsBuilder => null;
}
