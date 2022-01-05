import 'package:get/get.dart';

import '../../../../Core/Configuracoes.dart';
import '../../../../Core/Services/InteraPay/InteraPayBottomSheet.dart';
import '../../../Dominio/Enums/Comuns/TiposDeSeguranca.dart';

class TiposDeSegurancaController extends GetxController {
  final Rxn<TiposDeSeguranca> _tipoDeSegurancaSelecionado = Rxn<TiposDeSeguranca>(Configuracoes.tipoDeSeguranca);
  TiposDeSeguranca? get tipoDeSegurancaSelecionado => _tipoDeSegurancaSelecionado.value;
  Future<void> selecionarTiposDeSeguranca(TiposDeSeguranca? value) async {
    if (value == tipoDeSegurancaSelecionado) {
      bool removerSeguranca = await InteraPayBottomSheet.show<bool>(
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
