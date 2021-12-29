import 'package:get/get.dart';
import '../Layers/Presentation/UI/Home/HomePage.dart';

class JuntaPayRoutes {
  static const SPLASH = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';

  static String get initialRoute => HOME;

  static List<GetPage> get routes => [
        GetPage(
          name: HOME,
           page: () => HomePage(),
        ),
      ];
}
