import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/ConfiguracoesController.dart';
import '../../../../Core/Theme/JuntaPayColors.dart';
import '../../../../Core/Componentes/AppBar.dart';
import '../ItemDaConfiguracao.dart';
import 'Widgets/ItemDaConfiguracaoWidget.dart';

class ConfiguracoesPage extends StatelessWidget {
  ConfiguracoesController get controller => Get.find<ConfiguracoesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JuntaPayAppBar(title: 'Configurações'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: MediaQuery.of(context).padding.bottom),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: ListView.custom(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childrenDelegate: SliverChildListDelegate.fixed(
                    controller.configuracoes.map((e) => ItemDaConfiguracaoWidget(configuracao: e)).toList(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: ListView.custom(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childrenDelegate: SliverChildListDelegate.fixed(
                    [
                      ItemDaConfiguracaoWidget(configuracao: ItemDaConfiguracao('Sobre')),
                      ItemDaConfiguracaoWidget(configuracao: ItemDaConfiguracao('Ajuda')),
                      ItemDaConfiguracaoWidget.withColor(ItemDaConfiguracao('Sair'), JuntaPayColors.error),
                    ],
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
