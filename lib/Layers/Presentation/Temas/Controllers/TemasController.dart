import 'package:get/get.dart';
import 'package:juntapay/Core/Services/Theme/ThemeService.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../Dominio/Enums/Comuns/Tema.dart';

class TemasController extends GetxController {
  final Rx<Tema> _temaSelecionado = Rx<Tema>(Configuracoes.tema);
  Tema get temaSelecionado => _temaSelecionado.value;
  Future<void> selecionarTema(Tema value) async {
    await ThemeService.alterarConfiguracaoDoTema(value);

    _temaSelecionado.value = Configuracoes.tema;
  }
}
