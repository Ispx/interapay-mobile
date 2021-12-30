import 'package:get/get.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../Dominio/Enums/Comuns/Linguagem.dart';

class LinguagensController extends GetxController {
  final Rx<Linguagem> _linguagemSelecionada = Rx<Linguagem>(Configuracoes.linguagem);
  Linguagem get linguagemSelecionada => _linguagemSelecionada.value;
  void selecionarLinguagem(Linguagem value) {
    _linguagemSelecionada.value = value;

    Configuracoes.alterarLinguagem(value);
  }
}
