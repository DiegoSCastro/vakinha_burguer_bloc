import 'package:flutter/material.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/helpers/size_extension.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/styles/app_colors.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: context.appColors.blackHomeBackground,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: context.percentHeight(0.3)),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 80),
                  DeliveryButton(
                    label: 'ACESSAR',
                    width: context.percentWidth(0.6),
                    height: 48,
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
