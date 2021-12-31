import 'package:get/get.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../Dominio/Enums/Comuns/Moedas.dart';

class MoedasController extends GetxController {
  final Rx<Moedas> _moedaSelecionada = Rx<Moedas>(Configuracoes.moeda);
  Moedas get moedaSelecionada => _moedaSelecionada.value;
  Future<void> selecionarMoeda(Moedas value) async {
    if (value == moedaSelecionada) return;

    await Configuracoes.alterarMoeda(value);

    _moedaSelecionada.value = Configuracoes.moeda;
  }
}
