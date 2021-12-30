import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'Core/Helpers/ScreenBreakpoints.dart';
import 'Core/Routes.dart';
import 'Core/Theme/JuntaPayTheme.dart';

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
      theme: JuntaPayTheme.light,
      darkTheme: JuntaPayTheme.dark,
      builder: (context, child) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(
          context,
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            behavior: HitTestBehavior.opaque,
            child: child,
          ),
        ),
        breakpoints: ScreenBreakpoints.breakpoints,
      ),
    );
  }
}
