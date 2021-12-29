import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/Routes.dart';

class JuntaPayApp extends StatelessWidget {
  final String initialRoute;

  const JuntaPayApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'JuntaPay',
      debugShowCheckedModeBanner: false,
      getPages: JuntaPayRoutes.routes,
      routeInformationParser: GetInformationParser(initialRoute: initialRoute),
      defaultTransition: Transition.cupertino,
      themeMode: ThemeMode.light,
      // theme: JuntaPayTheme.light,
      // darkTheme: JuntaPayTheme.dark,
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: child,
      ),
    );
  }
}
