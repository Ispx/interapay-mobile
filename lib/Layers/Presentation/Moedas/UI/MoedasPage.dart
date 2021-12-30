import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Dominio/Enums/Comuns/Moeda.dart';
import '../Controllers/MoedasController.dart';
import '../../../../Core/Componentes/CardItemWidget.dart';
import '../../../../Core/Componentes/CheckWidget.dart';
import '../../../../Core/Theme/JuntaPayColors.dart';
import '../../../../Core/Componentes/AppBar.dart';

class MoedasPage extends StatelessWidget {
  MoedasController get controller => Get.find<MoedasController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JuntaPayAppBar(title: 'Moedas'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: MediaQuery.of(context).padding.bottom),
          child: Column(
            children: [
              Obx(
                () => Container(
                  color: Colors.white,
                  child: ListView.custom(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childrenDelegate: SliverChildListDelegate.fixed(
                      Moeda.values
                          .map(
                            (moeda) => CardItemWidget(
                              backgroundColor: controller.moedaSelecionada == moeda ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.transparent,
                              onTap: () => controller.selecionarMoeda(moeda),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      moeda.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: JuntaPayColors.baseDark75,
                                      ),
                                    ),
                                  ),
                                  if (controller.moedaSelecionada == moeda) ...{
                                    CheckWidget(checked: true),
                                  },
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
