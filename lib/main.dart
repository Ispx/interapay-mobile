import 'package:flutter/material.dart';

import 'JuntaPayApp.dart';
import 'Core/Initializer.dart';
import 'Core/Routes.dart';

void main() async {
  await Initializer.init();

  runApp(JuntaPayApp(initialRoute: JuntaPayRoutes.initialRoute));
}
