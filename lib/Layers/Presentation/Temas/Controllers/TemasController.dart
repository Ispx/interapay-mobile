import 'package:get/get.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../Dominio/Enums/Comuns/Tema.dart';

class TemasController extends GetxController {
  final Rx<Tema> _temaSelecionado = Rx<Tema>(Configuracoes.tema);
  Tema get temaSelecionado => _temaSelecionado.value;
  void selecionarTema(Tema value) {
    // Configuracoes.alterarTema(value);

    _temaSelecionado.value = Configuracoes.tema;
  }
}
