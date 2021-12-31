import '../../Routes.dart';

abstract class JuntaPayRouter {
  Future<T?>? to<T>(String route, {bool closeAll = false, dynamic arguments});
  Future<T?>? toHome<T>({String route = JuntaPayRoutes.HOME, bool closeAll = false});
  Future<T?>? toConfiguracoes<T>({String route = JuntaPayRoutes.CONFIGURACOES, bool closeAll = false});
  Future<T?>? toMoedas<T>({String route = JuntaPayRoutes.MOEDAS, bool closeAll = false});
  Future<T?>? toLinguagens<T>({String route = JuntaPayRoutes.LINGUAGENS, bool closeAll = false});
  Future<T?>? toTemas<T>({String route = JuntaPayRoutes.TEMAS, bool closeAll = false});
  Future<T?>? toTiposDeSeguranca<T>({String route = JuntaPayRoutes.TIPOS_DE_SEGURANCA, bool closeAll = false});
  Future<T?>? toNotificacoes<T>({String route = JuntaPayRoutes.NOTIFICACOES, bool closeAll = false});
  Future<T?>? toSobre<T>({String route = JuntaPayRoutes.SOBRE, bool closeAll = false});
  
  void back<T>({T? result});
}
