import 'package:flutter/material.dart';
import 'package:vakinha_burguer_bloc/app/core/provider/app_binding.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/theme/theme_config.dart';
import 'package:vakinha_burguer_bloc/app/pages/auth/register/register_page.dart';
import 'package:vakinha_burguer_bloc/app/pages/product_detail/product_detail_router.dart';
import 'package:vakinha_burguer_bloc/app/pages/splash/splash_page.dart';

import 'pages/auth/login/login_page.dart';
import 'pages/home/home_router.dart';

class VakinhaBurguerApp extends StatelessWidget {
  const VakinhaBurguerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBinding(
      child: MaterialApp(
        title: 'Vakinha Burguer',
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => LoginPage(),
          '/auth/register': (context) => RegisterPage(),
        },
      ),
    );
  }
}
