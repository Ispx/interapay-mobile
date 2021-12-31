import 'package:get/get.dart';

import '../../../../Core/Services/Theme/ThemeService.dart';
import '../../../../Core/Configuracoes.dart';
import '../../../Dominio/Enums/Comuns/Temas.dart';

class TemasController extends GetxController {
  final Rx<Temas> _temaSelecionado = Rx<Temas>(Configuracoes.tema);
  Temas get temaSelecionado => _temaSelecionado.value;
  Future<void> selecionarTema(Temas value) async {
    if (value == temaSelecionado) return;

    await ThemeService.alterarConfiguracaoDoTema(value);

    _temaSelecionado.value = Configuracoes.tema;
  }
}
