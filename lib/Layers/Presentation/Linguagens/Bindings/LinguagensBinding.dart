import 'package:get/get.dart';

import '../Controllers/LinguagensController.dart';


class LinguagensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinguagensController());
  }
}
