import 'package:get/get.dart';

import 'Router.dart';
import '../../Routes.dart';

class GetxJuntaPayRouter extends GetxService implements JuntaPayRouter {
  @override
  Future<T?>? to<T>(String route, {bool closeAll = false, dynamic arguments}) =>
      closeAll == true ? Get.offAndToNamed(route, arguments: arguments) : Get.toNamed<T>(route, arguments: arguments);

  @override
  Future<T?>? toHome<T>({String route = JuntaPayRoutes.HOME, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toConfiguracoes<T>({String route = JuntaPayRoutes.CONFIGURACOES, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toMoedas<T>({String route = JuntaPayRoutes.MOEDAS, bool closeAll = false}) => to<T>(route, closeAll: closeAll);
}

JuntaPayRouter get router => Get.find<JuntaPayRouter>();
