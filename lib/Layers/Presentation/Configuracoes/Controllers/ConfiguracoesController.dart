import 'package:get/get.dart';

import '../../../../Core/Services/JuntaPay/JuntaPayService.dart';

class ConfiguracoesController extends GetxController {
  Future<void> sairDaConta() async {
    bool sair = await JuntaPay.bottomSheet<bool>(
          title: 'Sair da conta?',
          description: 'Tem certeza que deseja sair da sua conta?',
        ) ??
        false;

    // if(sair == true)//TODO: Criar o logout
  }
}
