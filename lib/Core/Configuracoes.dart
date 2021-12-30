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

  static late Moeda moeda;
  static String get siglaMoedaTexto => moeda.sigla;

  static late Linguagem linguagem;
  static String get linguagemTexto => linguagem.name;

  static late Tema tema;
  static String get temaTexto => tema.name;

  static TipoDeSeguranca? tipoDeSeguranca;
  static String? get tipoDeSegurancaTexto => tipoDeSeguranca?.name;

  static Future<void> init() async {
    moeda = Moeda.BRL;
    linguagem = Linguagem.PT;
    tema = Tema.Claro;
    assinatura = Assinatura.Gratis;
    versaoDoAplicativo = await _obterVersaoDoAplicativo();
  }

  static Future<String> _obterVersaoDoAplicativo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
