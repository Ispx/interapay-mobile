import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/JuntaPayProWidget.dart';
import 'Widgets/ItemDaConfiguracaoWidget.dart';
import '../ItemDaConfiguracao.dart';
import '../Controllers/ConfiguracoesController.dart';
import '../../../../Core/Services/JuntaPay/JuntaPayBottomSheet.dart';
import '../../../../Core/Configuracoes.dart';
import '../../../../Core/Theme/JuntaPayColors.dart';
import '../../../../Core/Services/Router/GetxRouter.dart';
import '../../../../Core/Componentes/AppBar.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({Key? key}) : super(key: key);

  ConfiguracoesController get controller => Get.find<ConfiguracoesController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: const JuntaPayAppBar(title: 'Configurações'),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: MediaQuery.of(context).padding.bottom),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: ListView.custom(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childrenDelegate: SliverChildListDelegate.fixed(
                      [
                        ItemDaConfiguracaoWidget(
                          titleWidget: const JuntaPayProWidget(),
                          onTap: () => JuntaPayBottomSheet.showAssinaturas(),
                        ),
                        ItemDaConfiguracaoWidget(
                          configuracao: ItemDaConfiguracao('Moeda', value: Configuracoes.siglaMoedaTexto),
                          onTap: () => router.toMoedas(),
                        ),
                        ItemDaConfiguracaoWidget(
                          configuracao: ItemDaConfiguracao('Linguagem', value: Configuracoes.linguagemTexto),
                          onTap: () => router.toLinguagens(),
                        ),
                        ItemDaConfiguracaoWidget(
                          configuracao: ItemDaConfiguracao('Tema', value: Configuracoes.temaTexto),
                          onTap: () => router.toTemas(),
                        ),
                        ItemDaConfiguracaoWidget(
                          configuracao: ItemDaConfiguracao('Segurança', value: Configuracoes.tipoDeSegurancaTexto ?? 'Não definido'),
                          onTap: () => router.toTiposDeSeguranca(),
                        ),
                        ItemDaConfiguracaoWidget(
                          configuracao: ItemDaConfiguracao('Notificação'),
                          onTap: () => router.toNotificacoes(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  child: ListView.custom(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childrenDelegate: SliverChildListDelegate.fixed(
                      [
                        ItemDaConfiguracaoWidget(
                          configuracao: ItemDaConfiguracao('Sobre'),
                          onTap: () => router.toSobre(),
                        ),
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
