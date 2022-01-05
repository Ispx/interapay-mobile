import 'package:get/get.dart';

import '../../../../Core/Services/InteraPay/InteraPayBottomSheet.dart';

class ConfiguracoesController extends GetxController {
  Future<void> sairDaConta() async {
    bool sair = await InteraPayBottomSheet.show<bool>(
          title: 'Sair da conta?',
          description: 'Tem certeza que deseja sair da sua conta?',
        ) ??
        false;

    //TODO: Criar o logout
    if (sair == true) print('efetuar logout');
  }

  void enviarEmailOuWhatsappParaSuporte() {
    //TODO: Criar implementação para enviar e-mail ou Whatsapp para o suporte.
  }
}
