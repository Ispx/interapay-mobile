import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'Services/Router/GetxRouter.dart';
import 'Services/Router/Router.dart';

class Initializer {
  const Initializer._();

  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      await _inicializarFirebaseCrashlytics();
      await _adicionarServicosGlobais();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<void> _adicionarServicosGlobais() async {
    Get.lazyPut<JuntaPayRouter>(() => GetxJuntaPayRouter());
  }

  static Future<void> _inicializarFirebaseCrashlytics() async {
    await Firebase.initializeApp();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }
}
