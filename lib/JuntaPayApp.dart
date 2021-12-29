import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JuntaPayApp extends StatelessWidget {
  final String initialRoute;

  const JuntaPayApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'JuntaPay',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      initialRoute: initialRoute,
      // getPages: InteraRoutes.routes,
      themeMode: ThemeMode.light,
      // theme: InteraTheme.light,
      // darkTheme: InteraTheme.dark,
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: child,
      ),
    );
  }
}
