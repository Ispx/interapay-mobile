import 'package:get/get.dart';

import '../Controllers/NotificacoesController.dart';


class NotificacoesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificacoesController());
  }
}
