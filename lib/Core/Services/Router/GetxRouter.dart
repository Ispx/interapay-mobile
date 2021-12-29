import 'package:get/get.dart';

import 'router.dart';
import '../../routes.dart';

class GetxJuntaPayRouter extends GetxService implements JuntaPayRouter {
  GetxJuntaPayRouter._();

  @override
  Future<T?>? to<T>(String route, {bool closeAll = false, dynamic arguments}) =>
      closeAll == true ? Get.offAndToNamed(route, arguments: arguments) : Get.toNamed<T>(route, arguments: arguments);

  @override
  Future<T?>? toHome<T>({String route = JuntaPayRoutes.HOME, bool closeAll = false}) => to<T>(route, closeAll: closeAll);
}

JuntaPayRouter get router => Get.find<JuntaPayRouter>();