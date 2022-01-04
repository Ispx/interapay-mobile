import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'Core/Helpers/ScreenBreakpoints.dart';
import 'Core/Routes.dart';
import 'Core/Services/Theme/ThemeService.dart';
import 'Core/Theme/JuntaPayTheme.dart';
import 'Layers/Dominio/Enums/Comuns/Temas.dart';
import 'Layers/Data/Database/Drift/DriftSqliteDatabase.dart';

class JuntaPayApp extends StatefulWidget {
  const JuntaPayApp({required this.initialRoute});

  final String initialRoute;

  @override
  State<JuntaPayApp> createState() => _JuntaPayAppState();
}

class _JuntaPayAppState extends State<JuntaPayApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    ThemeService.init();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (ThemeService.temaAtual == Temas.Dispositivo) ThemeService.alterarParaTemaDoDispositivo();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'JuntaPay',
      debugShowCheckedModeBanner: false,
      getPages: JuntaPayRoutes.routes,
      initialRoute: widget.initialRoute,
      defaultTransition: Transition.cupertino,
      themeMode: ThemeService.temaAtual != Temas.Dispositivo
          ? ThemeService.temaAtual == Temas.Claro
              ? ThemeMode.light
              : ThemeMode.dark
          : ThemeMode.system,
      theme: JuntaPayTheme.light,
      darkTheme: JuntaPayTheme.dark,
      onDispose: () async => await database.close(),
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
