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

  static late Rx<Moeda> _moeda;
  static Moeda get moeda => _moeda.value;
  static String get siglaMoedaTexto => moeda.sigla;
  static void alterarMoeda(Moeda moeda) => _moeda.value = moeda;

  static late Rx<Linguagem> _linguagem;
  static Linguagem get linguagem => _linguagem.value;
  static String get linguagemTexto => linguagem.name;

  static late Rx<Tema> _tema;
  static Tema get tema => _tema.value;
  static String get temaTexto => tema.name;

  static Rxn<TipoDeSeguranca> _tipoDeSeguranca = Rxn<TipoDeSeguranca>();
  static TipoDeSeguranca? get tipoDeSeguranca => _tipoDeSeguranca.value;
  static String? get tipoDeSegurancaTexto => tipoDeSeguranca?.name;

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
