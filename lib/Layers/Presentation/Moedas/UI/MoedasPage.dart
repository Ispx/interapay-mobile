import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Dominio/Enums/Comuns/Moedas.dart';
import '../Controllers/MoedasController.dart';
import '../../../../Core/Componentes/AppBar.dart';
import '../../../../Core/Componentes/List/BaseSelectableList.dart';

class MoedasPage extends StatelessWidget {
  MoedasController get controller => Get.find<MoedasController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: JuntaPayAppBar(title: 'Moedas'),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BaseSelectableList<Moedas>(
            list: Moedas.values,
            titleGetter: (e) => e.nome,
            onSelect: controller.selecionarMoeda,
            selected: controller.moedaSelecionada,
          ),
        ),
      ),
    );
  }
}
