import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'Core/Helpers/ScreenBreakpoints.dart';
import 'Core/Routes.dart';
import 'Core/Services/Theme/ThemeService.dart';
import 'Core/Theme/InteraPayTheme.dart';
import 'Layers/Dominio/Enums/Comuns/Temas.dart';
import 'Layers/Data/Database/Drift/DriftSqliteDatabase.dart';

class InteraPayApp extends StatefulWidget {
  const InteraPayApp({required this.initialRoute});

  final String initialRoute;

  @override
  State<InteraPayApp> createState() => _InteraPayAppState();
}

class _InteraPayAppState extends State<InteraPayApp>
    with WidgetsBindingObserver {
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
    if (ThemeService.temaAtual == Temas.Dispositivo)
      ThemeService.alterarParaTemaDoDispositivo();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_Br');
    return GetMaterialApp(
      title: 'InteraPay',
      debugShowCheckedModeBanner: false,
      getPages: InteraPayRoutes.routes,
      initialRoute: widget.initialRoute,
      defaultTransition: Transition.cupertino,
      themeMode: ThemeService.temaAtual != Temas.Dispositivo
          ? ThemeService.temaAtual == Temas.Claro
              ? ThemeMode.light
              : ThemeMode.dark
          : ThemeMode.system,
      theme: InteraPayTheme.light,
      darkTheme: InteraPayTheme.dark,
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
