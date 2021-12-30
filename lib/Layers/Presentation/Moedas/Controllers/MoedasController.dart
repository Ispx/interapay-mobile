import 'package:get/get.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../Dominio/Enums/Comuns/Moeda.dart';

class MoedasController extends GetxController {
  final Rx<Moeda> _moedaSelecionada = Rx<Moeda>(Configuracoes.moeda);
  Moeda get moedaSelecionada => _moedaSelecionada.value;
  void selecionarMoeda(Moeda moeda) {
    _moedaSelecionada.value = moeda;

    Configuracoes.alterarMoeda(moeda);
  }
}
