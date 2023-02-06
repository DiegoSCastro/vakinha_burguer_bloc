import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_styles.dart';
import '../styles/app_text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    primaryColor: AppColors.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.i.primary,
      primary: AppColors.i.primary,
      secondary: AppColors.i.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.i.primaryButtom,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: AppTextStyles.i.textRegular.copyWith(color: Colors.black),
      errorStyle: AppTextStyles.i.textRegular.copyWith(color: Colors.redAccent),
    ),
  );

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );
}
