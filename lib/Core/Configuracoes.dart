import 'package:package_info_plus/package_info_plus.dart';

import '../Layers/Dominio/Enums/Comuns/Assinatura.dart';
import '../Layers/Dominio/Enums/Comuns/Linguagem.dart';
import '../Layers/Dominio/Enums/Comuns/Moeda.dart';
import '../Layers/Dominio/Enums/Comuns/Tema.dart';
import '../Layers/Dominio/Enums/Comuns/TipoDeSeguranca.dart';

class Configuracoes {
  const Configuracoes._();

  static late String versaoDoAplicativo;
  static late Moeda moeda;
  static late Linguagem linguagem;
  static late Tema tema;
  static late TipoDeSeguranca? tipoDeSeguranca;
  static late Assinatura assinatura;

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
