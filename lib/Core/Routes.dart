import 'package:get/get.dart';
import '../Layers/Presentation/Configuracoes/Bindings/ConfiguracoesBinding.dart';
import '../Layers/Presentation/Configuracoes/UI/ConfiguracoesPage.dart';
import '../Layers/Presentation/Home/UI/HomePage.dart';

class JuntaPayRoutes {
  JuntaPayRoutes._();

  static const SPLASH = '/';
  static const HOME = '/home';
  static const CONFIGURACOES = '/configuracoes';
  static const LOGIN = '/login';

  static String get initialRoute => CONFIGURACOES;

  static List<GetPage> get routes => [
        GetPage(
          name: HOME,
          page: () => HomePage(),
        ),
        GetPage(
          name: CONFIGURACOES,
          page: () => ConfiguracoesPage(),
          binding: ConfiguracoesBinding(),
        ),
      ];
}
