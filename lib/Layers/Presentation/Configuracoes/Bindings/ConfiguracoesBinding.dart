import 'package:get/get.dart';

import '../Controllers/ConfiguracoesController.dart';


class ConfiguracoesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfiguracoesController());
  }
}
