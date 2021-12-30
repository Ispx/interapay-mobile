import '../../Routes.dart';

abstract class JuntaPayRouter {
  Future<T?>? to<T>(String route, {bool closeAll = false, dynamic arguments});
  Future<T?>? toHome<T>({String route = JuntaPayRoutes.HOME, bool closeAll = false});
  Future<T?>? toConfiguracoes<T>({String route = JuntaPayRoutes.CONFIGURACOES, bool closeAll = false});
  Future<T?>? toMoedas<T>({String route = JuntaPayRoutes.MOEDAS, bool closeAll = false});
}
