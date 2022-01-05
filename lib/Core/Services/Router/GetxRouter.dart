import 'package:get/get.dart';

import 'Router.dart';
import '../../Routes.dart';

class GetxInteraPayRouter extends GetxService implements InteraPayRouter {
  @override
  Future<T?>? to<T>(String route, {bool closeAll = false, dynamic arguments}) =>
      closeAll == true ? Get.offAndToNamed(route, arguments: arguments) : Get.toNamed<T>(route, arguments: arguments);

  @override
  Future<T?>? toHome<T>({String route = InteraPayRoutes.HOME, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toConfiguracoes<T>({String route = InteraPayRoutes.CONFIGURACOES, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toMoedas<T>({String route = InteraPayRoutes.MOEDAS, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toLinguagens<T>({String route = InteraPayRoutes.LINGUAGENS, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toNotificacoes<T>({String route = InteraPayRoutes.NOTIFICACOES, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toTemas<T>({String route = InteraPayRoutes.TEMAS, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  Future<T?>? toTiposDeSeguranca<T>({String route = InteraPayRoutes.TIPOS_DE_SEGURANCA, bool closeAll = false}) => to<T>(route, closeAll: closeAll);
  @override
  Future<T?>? toSobre<T>({String route = InteraPayRoutes.SOBRE, bool closeAll = false}) => to<T>(route, closeAll: closeAll);

  @override
  void back<T>({T? result}) => Get.back<T>(result: result);
}

InteraPayRouter get router => Get.find<InteraPayRouter>();
