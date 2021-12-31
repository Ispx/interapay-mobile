import 'package:get/get.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../../Core/Services/JuntaPay/JuntaPayBottomSheet.dart';
import '../../../Dominio/Enums/Comuns/TipoDeSeguranca.dart';

class TiposDeSegurancaController extends GetxController {
  final Rxn<TipoDeSeguranca> _tipoDeSegurancaSelecionado = Rxn<TipoDeSeguranca>(Configuracoes.tipoDeSeguranca);
  TipoDeSeguranca? get tipoDeSegurancaSelecionado => _tipoDeSegurancaSelecionado.value;
  Future<void> selecionarTiposDeSeguranca(TipoDeSeguranca? value) async {
    if (value == tipoDeSegurancaSelecionado) {
      bool removerSeguranca = await JuntaPayBottomSheet.show<bool>(
        title: 'Remover segurança?',
        description: 'Tem certeza que deseja remover a segurança do seu aplicativo?',
      ) ?? false;

      if (removerSeguranca == false) {
        return;
      }
    }

    await Configuracoes.alterarTipoDeSeguranca(value == tipoDeSegurancaSelecionado ? null : value);

    _tipoDeSegurancaSelecionado.value = Configuracoes.tipoDeSeguranca;
  }
}
