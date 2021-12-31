import 'package:get/get.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../Dominio/Enums/Comuns/Linguagens.dart';

class LinguagensController extends GetxController {
  final Rx<Linguagens> _linguagemSelecionada = Rx<Linguagens>(Configuracoes.linguagem);
  Linguagens get linguagemSelecionada => _linguagemSelecionada.value;
  Future<void> selecionarLinguagem(Linguagens value) async {
    if (value == linguagemSelecionada) return;

    await Configuracoes.alterarLinguagem(value);

    _linguagemSelecionada.value = Configuracoes.linguagem;
  }
}
