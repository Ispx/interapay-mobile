import '../../Enums/Comuns/Assinatura.dart';
import '../../Enums/Comuns/Linguagem.dart';
import '../../Enums/Comuns/Moeda.dart';
import '../../Enums/Comuns/Tema.dart';
import '../../Enums/Comuns/TipoDeSeguranca.dart';

class Configuracao {
  const Configuracao._();

  static late Moeda moeda;
  static late Linguagem linguagem;
  static late Tema tema;
  static late TipoDeSeguranca? tipoDeSeguranca;
  static late Assinatura assinatura;

  static void init() {
    moeda = Moeda.BRL;
    linguagem = Linguagem.PT;
    tema = Tema.Claro;
    assinatura = Assinatura.Gratis;
  }
}

