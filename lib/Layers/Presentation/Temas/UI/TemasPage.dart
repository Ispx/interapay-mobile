import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Dominio/Enums/Comuns/Tema.dart';
import '../Controllers/TemasController.dart';
import '../../../../Core/Componentes/AppBar.dart';
import '../../../../Core/Componentes/List/BaseSelectableList.dart';

class TemasPage extends StatelessWidget {
  TemasController get controller => Get.find<TemasController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: JuntaPayAppBar(title: 'Temas'),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BaseSelectableList<Tema>(
            list: Tema.values,
            titleGetter: (e) => e.name,
            onSelect: (v) async => await controller.selecionarTema(v),
            selected: controller.temaSelecionado,
          ),
        ),
      ),
    );
  }
}
