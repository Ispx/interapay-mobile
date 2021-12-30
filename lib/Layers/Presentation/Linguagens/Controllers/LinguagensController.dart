import 'package:get/get.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../Dominio/Enums/Comuns/Linguagem.dart';

class LinguagensController extends GetxController {
  final Rx<Linguagem> _linguagemSelecionada = Rx<Linguagem>(Configuracoes.linguagem);
  Linguagem get linguagemSelecionada => _linguagemSelecionada.value;
  Future<void> selecionarLinguagem(Linguagem value) async {
    if (value == linguagemSelecionada) return;

    await Configuracoes.alterarLinguagem(value);

    _linguagemSelecionada.value = Configuracoes.linguagem;
  }
}
