import 'package:intl/intl.dart';

import '../../Enums/Comuns/Linguagem.dart';
import '../../Enums/Comuns/Moeda.dart';
import '../../Enums/Comuns/Tema.dart';
import '../../Enums/Comuns/TipoDeSeguranca.dart';

class Configuracao {
  static late Moeda moeda;
  static late Linguagem linguagem;
  static late Tema tema;
  static late TipoDeSeguranca? tipoDeSeguranca;

  static void init() {
    moeda = Moeda.BRL;
    linguagem = Linguagem.PT;
    tema = Tema.Claro;
  }
}
