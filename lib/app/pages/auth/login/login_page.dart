import 'package:flutter/material.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/styles/app_text_styles.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/widgets/delivery_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: context.appTextStyles.textTitle,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'E-mail'),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Senha'),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: DeliveryButton(
                        width: double.infinity,
                        onPressed: () {},
                        label: 'ENTRAR',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não possui uma conta?',
                      style: context.appTextStyles.textBold,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/auth/register');
                      },
                      child: Text(
                        'Cadastre-se',
                        style: context.appTextStyles.textBold.copyWith(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
