import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/SobreController.dart';
import '../../../ItemDaConfiguracao.dart';
import '../../../UI/Widgets/ItemDaConfiguracaoWidget.dart';
import '../../../../../../Core/Theme/InteraPayFont.dart';
import '../../../../../../Core/Configuracoes.dart';
import '../../../../../../Core/Componentes/AppBar.dart';
import '../../../../../../Core/Theme/InteraPayColors.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

  SobreController get controller => Get.find<SobreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const InteraPayAppBar(title: 'Sobre'),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            constraints: constraints,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: MediaQuery.of(context).padding.bottom),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: ListView.custom(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              childrenDelegate: SliverChildListDelegate.fixed(
                                [
                                  ItemDaConfiguracaoWidget(
                                    configuracao: ItemDaConfiguracao('Avalie o InteraPay'),
                                    onTap: () => controller.avaliarApp(),
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
                                    configuracao: ItemDaConfiguracao(
                                      'Versão do App',
                                      value: Configuracoes.versaoDoAplicativo,
                                    ),
                                  ),
                                  ItemDaConfiguracaoWidget(
                                    configuracao: ItemDaConfiguracao('Política de Privacidade'),
                                    onTap: () => controller.abrirPoliticaDePrivacidade(),
                                  ),
                                  ItemDaConfiguracaoWidget(
                                    configuracao: ItemDaConfiguracao(
                                      'Termos de Serviço',
                                    ),
                                    onTap: () => controller.abrirTermosDeServico(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          'Desenvolvido por Bernardo Veras',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: InteraPayColors.textGray,
                            fontWeight: InteraPayFont.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
