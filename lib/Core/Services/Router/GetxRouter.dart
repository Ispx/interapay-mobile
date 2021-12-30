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

  @override
  Future<T?>? toLinguagens<T>({String route = JuntaPayRoutes.LINGUAGENS, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toNotificacoes<T>({String route = JuntaPayRoutes.NOTIFICACOES, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toTemas<T>({String route = JuntaPayRoutes.TEMAS, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toTiposDeSeguranca<T>({String route = JuntaPayRoutes.TIPOS_DE_SEGURANCA, bool closeAll = false}) => to<T>(route, closeAll: closeAll);
}

JuntaPayRouter get router => Get.find<JuntaPayRouter>();
