import 'package:flutter/material.dart';
import 'package:vakinha_burguer_bloc/app/vakinha_burguer_app.dart';

import 'app/core/config/env/env.dart';

void main() async {
  await Env.i.load();
  runApp(
    const VakinhaBurguerApp(),
  );
}
