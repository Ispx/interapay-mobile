import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Configuracoes.dart';
import 'Services/LocalStorage/SharedPreferencesLocalStorageService.dart';
import 'Services/LocalStorage/ILocalStorageService.dart';
import 'Services/Router/GetxRouter.dart';
import 'Services/Router/Router.dart';

class Initializer {
  const Initializer._();

  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      if (kIsWeb == false) await _inicializarFirebaseCrashlytics();

      await _adicionarServicosGlobais();

      await Configuracoes.init();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<void> _adicionarServicosGlobais() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut<ILocalStorageService>(() => SharedPreferencesLocalStorageService(_sharedPreferences));

    Get.lazyPut<JuntaPayRouter>(() => GetxJuntaPayRouter());
  }

  static Future<void> _inicializarFirebaseCrashlytics() async {
    await Firebase.initializeApp();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }
}
