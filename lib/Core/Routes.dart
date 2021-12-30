import 'package:get/get.dart';

import '../Layers/Presentation/Home/UI/HomePage.dart';
import '../Layers/Presentation/Moeda/UI/MoedasPage.dart';
import '../Layers/Presentation/Moeda/Bindings/MoedasBinding.dart';
import '../Layers/Presentation/Configuracoes/UI/ConfiguracoesPage.dart';
import '../Layers/Presentation/Configuracoes/Bindings/ConfiguracoesBinding.dart';
import '../Layers/Presentation/Linguagens/UI/LinguagensPage.dart';
import '../Layers/Presentation/Linguagens/Bindings/LinguagensBinding.dart';

class JuntaPayRoutes {
  JuntaPayRoutes._();

  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const CONFIGURACOES = '/configuracoes';
  static const MOEDAS = '$CONFIGURACOES/moedas';
  static const LINGUAGENS = '$CONFIGURACOES/linguagens';

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
        GetPage(
          name: MOEDAS,
          page: () => MoedasPage(),
          binding: MoedasBinding(),
        ),
        GetPage(
          name: LINGUAGENS,
          page: () => LinguagensPage(),
          binding: LinguagensBinding(),
        ),
      ];
}
