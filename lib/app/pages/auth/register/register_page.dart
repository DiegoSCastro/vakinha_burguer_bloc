import 'package:flutter/material.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/styles/app_text_styles.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/widgets/delivery_button.dart';

import '../../../core/ui/widgets/delivery_appbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.appTextStyles.textTitle,
                ),
                Text(
                  'Preencha os campos abaixo para criar o seu cadastro.',
                  style: context.appTextStyles.textMedium.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirmar senha'),
                ),
                const SizedBox(height: 30),
                Center(
                  child: DeliveryButton(
                    onPressed: () {},
                    label: 'Cadastrar',
                    width: double.infinity,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
