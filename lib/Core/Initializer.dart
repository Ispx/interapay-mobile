import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'Services/Router/GetxRouter.dart';
import 'Services/Router/Router.dart';

class Initializer {
  const Initializer._();

  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      await _adicionarServicosGlobais();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<void> _adicionarServicosGlobais() async {
    Get.lazyPut<JuntaPayRouter>(() => GetxJuntaPayRouter());
  }
}
