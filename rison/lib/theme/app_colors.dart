import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color purple = Color(0xFF4C338F);
  static const Color black = Color(0xFF000000);

  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFF9B9B9B);

  static const Color lightPink = Color(0xFFFFF1F1);
  static const Color lightPurple = Color(0xFFBC41FF);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [purple, black],
  );

  static const LinearGradient barGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [white, gray],
  );

  static const Color purpleLight = Color(0xFF8B6FC7);

  static const LinearGradient boxGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [lightPurple, lightPink],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [purpleLight, purple],
  );

  static List<BoxShadow> softShadow({double opacity = 0.35}) => [
    BoxShadow(
      color: black.withOpacity(opacity),
      blurRadius: 18,
      offset: const Offset(0, 8),
    ),
  ];
}
