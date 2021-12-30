import 'package:get/get.dart';

import '../Controllers/TemasController.dart';


class TemasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TemasController());
  }
}
