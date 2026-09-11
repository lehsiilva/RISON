import 'package:flutter/material.dart';

class ArcLinesPainter extends CustomPainter {
  const ArcLinesPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final topPath = Path()
      ..moveTo(0, size.height * 0.16)
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 0.30,
        size.width,
        size.height * 0.16,
      );

    final bottomPath = Path()
      ..moveTo(0, size.height * 0.84)
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 0.70,
        size.width,
        size.height * 0.84,
      );

    canvas.drawPath(topPath, paint);
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
