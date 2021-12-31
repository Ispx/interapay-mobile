import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juntapay/Core/Theme/JuntaPayFont.dart';

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
    return Obx(
      () => Scaffold(
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
                          configuracao: ItemDaConfiguracao('Moeda', value: Configuracoes.siglaMoedaTexto),
                          onTap: () {
                            router.toMoedas();
                          },
                        ),
                        ItemDaConfiguracaoWidget(
                          configuracao: ItemDaConfiguracao('Linguagem', value: Configuracoes.linguagemTexto),
                          onTap: () {
                            router.toLinguagens();
                          },
                        ),
                        ItemDaConfiguracaoWidget(
                          configuracao: ItemDaConfiguracao('Tema', value: Configuracoes.temaTexto),
                          onTap: () {
                            router.toTemas();
                          },
                        ),
                        ItemDaConfiguracaoWidget(
                          configuracao: ItemDaConfiguracao('Segurança', value: Configuracoes.tipoDeSegurancaTexto ?? 'Não definido'),
                          onTap: () {
                            router.toTiposDeSeguranca();
                          },
                        ),
                        ItemDaConfiguracaoWidget(
                          configuracao: ItemDaConfiguracao('Notificação'),
                          onTap: () {
                            router.toNotificacoes();
                          },
                        ),
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
                        ItemDaConfiguracaoWidget.withColor(
                          configuracao: ItemDaConfiguracao('Sair'),
                          color: JuntaPayColors.error,
                          onTap: () => controller.sairDaConta(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
