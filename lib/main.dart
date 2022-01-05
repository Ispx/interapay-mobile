import 'package:flutter/material.dart';

import 'InteraPayApp.dart';
import 'Core/Initializer.dart';
import 'Core/Routes.dart';

void main() async {
  await Initializer.init();

  runApp(InteraPayApp(initialRoute: InteraPayRoutes.initialRoute));
}
