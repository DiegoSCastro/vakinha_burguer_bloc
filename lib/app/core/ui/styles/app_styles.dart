import 'package:flutter/material.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/styles/app_colors.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/styles/app_text_styles.dart';

class AppStyles {
  static AppStyles? _instance;
  AppStyles._();

  static AppStyles get i {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButtom => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: AppColors.i.primary,
        textStyle: AppTextStyles.i.textButtonLabel,
      );
}

extension AppStylesExtensions on BuildContext {
  AppStyles get appStyles => AppStyles.i;
}
