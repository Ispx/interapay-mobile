import 'package:get/get.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../Dominio/Enums/Comuns/TipoDeSeguranca.dart';

class TiposDeSegurancaController extends GetxController {
  final Rxn<TipoDeSeguranca> _tipoDeSegurancaSelecionado = Rxn<TipoDeSeguranca>(Configuracoes.tipoDeSeguranca);
  TipoDeSeguranca? get tipoDeSegurancaSelecionado => _tipoDeSegurancaSelecionado.value;
  Future<void> selecionarTiposDeSeguranca(TipoDeSeguranca? value) async {
    if (value == tipoDeSegurancaSelecionado) return;

    if (value == null) {
      //TODO: Perguntar para o usuário se deseja remover a segurança
      //caso sim:
      //continue;
      //caso não:
      // break ou return;
    }

    await Configuracoes.alterarTipoDeSeguranca(value);

    _tipoDeSegurancaSelecionado.value = Configuracoes.tipoDeSeguranca;
  }
}
