import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Dominio/Enums/Comuns/Linguagens.dart';
import '../Controllers/LinguagensController.dart';
import '../../../../Core/Componentes/AppBar.dart';
import '../../../../Core/Componentes/List/BaseSelectableList.dart';

class LinguagensPage extends StatelessWidget {
  LinguagensController get controller => Get.find<LinguagensController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: JuntaPayAppBar(title: 'Linguagens'),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BaseSelectableList<Linguagens>(
            list: Linguagens.values,
            titleGetter: (e) => e.nomeComSigla,
            onSelect: (v) async => await controller.selecionarLinguagem(v),
            selected: controller.linguagemSelecionada,
          ),
        ),
      ),
    );
  }
}
