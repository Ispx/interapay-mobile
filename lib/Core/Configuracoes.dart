import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../Layers/Dominio/Enums/Comuns/Assinatura.dart';
import '../Layers/Dominio/Enums/Comuns/Linguagem.dart';
import '../Layers/Dominio/Enums/Comuns/Moeda.dart';
import '../Layers/Dominio/Enums/Comuns/Tema.dart';
import '../Layers/Dominio/Enums/Comuns/TipoDeSeguranca.dart';

class Configuracoes {
  const Configuracoes._();

  static late String versaoDoAplicativo;
  static late Assinatura assinatura;

  static late final Rx<Moeda> _moeda;
  static Moeda get moeda => _moeda.value;
  static String get siglaMoedaTexto => moeda.sigla;
  static void alterarMoeda(Moeda value) => _moeda.value = value;

  static late final Rx<Linguagem> _linguagem;
  static Linguagem get linguagem => _linguagem.value;
  static String get linguagemTexto => linguagem.name;
  static void alterarLinguagem(Linguagem value) => _linguagem.value = value;

  static late final Rx<Tema> _tema;
  static Tema get tema => _tema.value;
  static String get temaTexto => tema.name;
  // static void alterarTema(Tema value) => _tema.value = value;

  static final Rxn<TipoDeSeguranca> _tipoDeSeguranca = Rxn<TipoDeSeguranca>();
  static TipoDeSeguranca? get tipoDeSeguranca => _tipoDeSeguranca.value;
  static String? get tipoDeSegurancaTexto => tipoDeSeguranca?.name;
  static void alterarTipoDeSeguranca(TipoDeSeguranca? value) => _tipoDeSeguranca.value = value;

  static final RxBool _permitirNotificacoesDasDespesas = RxBool(true);
  static bool get permitirNotificacoesDasDespesas => _permitirNotificacoesDasDespesas.value;
  static void alterarNotificacoesDasDespesas(bool value) => _permitirNotificacoesDasDespesas.value = value;

  static final RxBool _permitirNotificacoesDeDicas = RxBool(true);
  static bool get permitirNotificacoesDeDicas => _permitirNotificacoesDeDicas.value;
  static void alterarNotificacoesDeDicas(bool value) => _permitirNotificacoesDeDicas.value = value;

  static final RxBool _permitirNotificacoesGeral = RxBool(true);
  static bool get permitirNotificacoesGeral => _permitirNotificacoesGeral.value;
  static void alterarNotificacoesGeral(bool value) {
    _permitirNotificacoesGeral.value = value;

    if (value == false) {
      alterarNotificacoesDasDespesas(false);
      alterarNotificacoesDeDicas(false);
    }
  }

  static Future<void> init() async {
    _moeda = Moeda.BRL.obs;
    _linguagem = Linguagem.PT.obs;
    _tema = Tema.Claro.obs;
    assinatura = Assinatura.Gratis;
    versaoDoAplicativo = await _obterVersaoDoAplicativo();
  }

  static Future<String> _obterVersaoDoAplicativo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
