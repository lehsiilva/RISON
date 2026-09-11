import 'package:flutter/material.dart';

/// Desenha as duas linhas curvas (tipo "olho") que aparecem
/// atrás das telas de login/cadastro no mockup.
class ArcLinesPainter extends CustomPainter {
  const ArcLinesPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    // Arco superior (curva para baixo, tipo sobrancelha)
    final topPath = Path()
      ..moveTo(0, size.height * 0.16)
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 0.30,
        size.width,
        size.height * 0.16,
      );

    // Arco inferior (curva para cima, tipo sorriso)
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
