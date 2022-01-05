import '../../Routes.dart';

abstract class InteraPayRouter {
  Future<T?>? to<T>(String route, {bool closeAll = false, dynamic arguments});
  Future<T?>? toHome<T>({String route = InteraPayRoutes.HOME, bool closeAll = false});
  Future<T?>? toConfiguracoes<T>({String route = InteraPayRoutes.CONFIGURACOES, bool closeAll = false});
  Future<T?>? toMoedas<T>({String route = InteraPayRoutes.MOEDAS, bool closeAll = false});
  Future<T?>? toLinguagens<T>({String route = InteraPayRoutes.LINGUAGENS, bool closeAll = false});
  Future<T?>? toTemas<T>({String route = InteraPayRoutes.TEMAS, bool closeAll = false});
  Future<T?>? toTiposDeSeguranca<T>({String route = InteraPayRoutes.TIPOS_DE_SEGURANCA, bool closeAll = false});
  Future<T?>? toNotificacoes<T>({String route = InteraPayRoutes.NOTIFICACOES, bool closeAll = false});
  Future<T?>? toSobre<T>({String route = InteraPayRoutes.SOBRE, bool closeAll = false});
  
  void back<T>({T? result});
}
