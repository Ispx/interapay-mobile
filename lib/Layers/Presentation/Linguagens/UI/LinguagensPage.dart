import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Dominio/Enums/Comuns/Linguagem.dart';
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
          child: BaseSelectableList<Linguagem>(
            list: Linguagem.values,
            titleGetter: (e) => e.name,
            onSelect: (v) async => await controller.selecionarLinguagem(v),
            selected: controller.linguagemSelecionada,
          ),
        ),
      ),
    );
  }
}
