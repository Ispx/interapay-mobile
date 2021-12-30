import 'package:get/get.dart';
import '../Layers/Presentation/_pages.dart';
import '../Layers/Presentation/_bindings.dart';

class JuntaPayRoutes {
  JuntaPayRoutes._();

  static String get initialRoute => CONFIGURACOES;

  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const CONFIGURACOES = '/configuracoes';
  static const MOEDAS = '$CONFIGURACOES/moedas';
  static const LINGUAGENS = '$CONFIGURACOES/linguagens';
  static const TEMAS = '$CONFIGURACOES/temas';
  static const TIPOS_DE_SEGURANCA = '$CONFIGURACOES/tiposdeseguranca';
  static const NOTIFICACOES = '$CONFIGURACOES/notificacoes';

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
        GetPage(
          name: TEMAS,
          page: () => TemasPage(),
          binding: TemasBinding(),
        ),
        GetPage(
          name: TIPOS_DE_SEGURANCA,
          page: () => TiposDeSegurancaPage(),
          binding: TiposDeSegurancaBinding(),
        ),
         GetPage(
          name: NOTIFICACOES,
          page: () => NotificacoesPage(),
          binding: NotificacoesBinding(),
        ),
      ];
}
