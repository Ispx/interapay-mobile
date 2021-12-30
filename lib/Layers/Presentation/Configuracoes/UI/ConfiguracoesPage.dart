import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/ItemDaConfiguracaoWidget.dart';
import '../ItemDaConfiguracao.dart';
import '../Controllers/ConfiguracoesController.dart';
import '../../../../Core/Configuracoes.dart';
import '../../../../Core/Theme/JuntaPayColors.dart';
import '../../../../Core/Services/Router/GetxRouter.dart';
import '../../../../Core/Componentes/AppBar.dart';

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
                    [
                      ItemDaConfiguracaoWidget(
                        configuracao: ItemDaConfiguracao('Moeda', value: Configuracoes.moedaTexto),
                        onTap: () {
                          router.toMoedas();
                        },
                      ),
                      ItemDaConfiguracaoWidget(configuracao: ItemDaConfiguracao('Linguagem', value: Configuracoes.linguagemTexto)),
                      ItemDaConfiguracaoWidget(configuracao: ItemDaConfiguracao('Tema', value: Configuracoes.temaTexto)),
                      ItemDaConfiguracaoWidget(
                        configuracao: ItemDaConfiguracao('Segurança', value: Configuracoes.tipoDeSegurancaTexto ?? 'Não definido'),
                      ),
                      ItemDaConfiguracaoWidget(configuracao: ItemDaConfiguracao('Notificação')),
                    ],
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
