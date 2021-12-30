import 'package:get/get.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../Dominio/Enums/Comuns/Moeda.dart';

class MoedasController extends GetxController {
  final Rx<Moeda> _moedaSelecionada = Rx<Moeda>(Configuracoes.moeda);
  Moeda get moedaSelecionada => _moedaSelecionada.value;
  Future<void> selecionarMoeda(Moeda value) async {
    if (value == moedaSelecionada) return;

    await Configuracoes.alterarMoeda(value);

    _moedaSelecionada.value = Configuracoes.moeda;
  }
}
