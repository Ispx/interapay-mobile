import 'package:get/get.dart';

import '../Controllers/TiposDeSegurancaController.dart';


class TiposDeSegurancaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TiposDeSegurancaController());
  }
}
