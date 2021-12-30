import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Dominio/Enums/Comuns/Moeda.dart';
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
        body: BaseSelectableList<Moeda>(
          list: Moeda.values,
          titleGetter: (e) => e.name,
          onSelect: controller.selecionarMoeda,
          selected: controller.moedaSelecionada,
        ),
      ),
    );
  }
}