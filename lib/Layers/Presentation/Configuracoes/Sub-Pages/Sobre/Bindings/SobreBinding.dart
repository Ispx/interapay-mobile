import 'package:get/get.dart';

import '../Controllers/SobreController.dart';


class SobreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SobreController());
  }
}
