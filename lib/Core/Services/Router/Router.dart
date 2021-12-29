import '../../Routes.dart';

abstract class JuntaPayRouter {
   Future<T?>? to<T>(String route, {bool closeAll = false, dynamic arguments});
  Future<T?>? toHome<T>({String route = JuntaPayRoutes.HOME, bool closeAll = false});
}