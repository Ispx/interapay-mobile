import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Dominio/Enums/Comuns/TipoDeSeguranca.dart';
import '../Controllers/TiposDeSegurancaController.dart';
import '../../../../Core/Componentes/AppBar.dart';
import '../../../../Core/Componentes/List/BaseSelectableList.dart';

class TiposDeSegurancaPage extends StatelessWidget {
  TiposDeSegurancaController get controller => Get.find<TiposDeSegurancaController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: JuntaPayAppBar(title: 'Segurança'),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BaseSelectableList<TipoDeSeguranca>(
            list: TipoDeSeguranca.values,
            titleGetter: (e) => e.name,
            onSelect: (v) async => await controller.selecionarTiposDeSeguranca(v),
            selected: controller.tipoDeSegurancaSelecionado,
          ),
        ),
      ),
    );
  }
}