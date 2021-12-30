import 'package:get/get.dart';
import '../../../../Core/Configuracoes.dart';
import '../ItemDaConfiguracao.dart';

class ConfiguracoesController extends GetxController {
  final RxList<ItemDaConfiguracao> configuracoes = RxList<ItemDaConfiguracao>();

  @override
  void onInit() {
    configuracoes.addAll([
      ItemDaConfiguracao('Moeda', value: Configuracoes.moedaTexto),
      ItemDaConfiguracao('Linguagem', value: Configuracoes.linguagemTexto),
      ItemDaConfiguracao('Tema', value: Configuracoes.temaTexto),
      ItemDaConfiguracao('Segurança', value: Configuracoes.tipoDeSegurancaTexto ?? 'Não definido'),
      ItemDaConfiguracao('Notificação'),
    ]);
    super.onInit();
  }
}
