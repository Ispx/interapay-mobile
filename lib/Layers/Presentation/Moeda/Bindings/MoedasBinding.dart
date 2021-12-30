import 'package:get/get.dart';

import '../Controllers/MoedasController.dart';


class MoedasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoedasController());
  }
}
