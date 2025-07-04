import 'package:flutter/material.dart';

/// Design system colors.
abstract final class AppColors {
  // Background colors.
  static const background = _Background();

  // Border colors.
  static const border = _Border();

  // Text colors.
  static const text = _Text();

  // State colors.
  static const state = _State();

  // Navigation colors.
  static const nav = _Navigation();

  // Surface colors.
  static const surface = _Surface();

  // Calendar colors.
  static const calendar = _Calendar();
}

// Shared color values.
abstract final class _SharedColors {
  // Whites.
  static const white = Color(0xFFFFFFFF);
  static const surfaceWhite = Color(0xFFF8F9FC);

  // Grays.
  static const gray50 = Color(0xFFF3F4F6);
  static const gray200 = Color(0xFFE5E7EB);
  static const gray300 = Color(0xFFD1D5DB);
  static const gray400 = Color(0xFF9CA3AF);
  static const gray500 = Color(0xFF6B7280);
  static const gray900 = Color(0xFF111827);
  static const indigo600 = Color(0xFF4F46E5);
  static const red600 = Color(0xFFDC2626);
  static const green600 = Color(0xFF059669);
  static const orange600 = Color(0xFFD97706);
}

class _Background {
  const _Background();

  // Light theme backgrounds.
  Color get baseWhite => _SharedColors.white;
  Color get surface => _SharedColors.surfaceWhite;
  Color get disabled => _SharedColors.gray50;
}

class _Border {
  const _Border();

  // Border colors.
  Color get main => _SharedColors.gray200;
  Color get hover => _SharedColors.gray300;
  Color get focused => _SharedColors.indigo600;
  Color get disabled => _SharedColors.gray50;
}

class _Text {
  const _Text();

  // Text colors.
  Color get primary => _SharedColors.gray900;
  Color get secondary => _SharedColors.gray500;
  Color get placeholder => _SharedColors.gray400;
  Color get disabled => _SharedColors.gray300;
  Color get error => _SharedColors.red600;
  Color get success => _SharedColors.green600;
  Color get warning => _SharedColors.orange600;
  Color get info => _SharedColors.indigo600;
}

class _State {
  const _State();

  // State colors.
  Color get error => _SharedColors.red600;
  Color get success => _SharedColors.green600;
  Color get warning => _SharedColors.orange600;
  Color get info => _SharedColors.indigo600;
}

class _Navigation {
  const _Navigation();
  Color get background => const Color(0xFF2B2D42);
  Color get title => _SharedColors.white;
  Color get divider => Colors.white30;
  Color get icon => _SharedColors.white;

  // Item States.
  Color get itemDefault => Colors.transparent;
  Color get itemHover => const Color(0xFF3D354A);
  Color get itemPressed => const Color(0xFF2F2A3B);

  Color get itemText => _SharedColors.white;
  Color get itemIcon => _SharedColors.white;
}

class _Surface {
  const _Surface();

  Color get background => _SharedColors.surfaceWhite;
}

class _Calendar {
  const _Calendar();

  Color get background => _SharedColors.surfaceWhite;
  Color get hourText => _SharedColors.gray500;
  Color get borderLight => _SharedColors.gray300;
  Color get borderLighter => _SharedColors.gray200;
}
