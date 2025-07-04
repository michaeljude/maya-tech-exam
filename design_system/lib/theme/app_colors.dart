import 'package:flutter/material.dart';

/// Design system colors.
abstract final class AppColors {
  // Background colors.
  static const background = _Background();
}

// Shared color values.
abstract final class _SharedColors {
  // Whites.
  static const white = Color(0xFFFFFFFF);
  static const surfaceWhite = Color(0xFFF8F9FC);

  static const mayaGreen = Color(0xFF33BA6A);
}

class _Background {
  const _Background();

  // Light theme backgrounds.
  Color get baseWhite => _SharedColors.white;
  Color get surface => _SharedColors.surfaceWhite;

  Color get mayaGreen => _SharedColors.mayaGreen;
}
