import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0xFF007D21);
  Color get secondary => const Color(0xFFF88B0C);
  Color get blackHomeBackground => const Color(0xFF140E0E);
}

extension AppColorsExtensions on BuildContext {
  AppColors get appColors => AppColors.i;
}
