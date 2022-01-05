import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/ItemNotificacaoWidget.dart';
import '../../../../Core/Configuracoes.dart';
import '../Controllers/NotificacoesController.dart';
import '../../../../Core/Componentes/AppBar.dart';

class NotificacoesPage extends StatelessWidget {
  NotificacoesController get controller => Get.find<NotificacoesController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: InteraPayAppBar(title: 'Notificações'),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10, bottom: MediaQuery.of(context).padding.bottom),
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                ItemNotificacaoWidget(
                  title: 'Despesas',
                  description: 'Receba notificações de pagamentos das despesas',
                  value: Configuracoes.permitirNotificacoesDasDespesas,
                  onChanged: (v) async => await Configuracoes.alterarNotificacoesDasDespesas(v),
                ),
                SizedBox(height: 24),
                ItemNotificacaoWidget(
                  title: 'Dicas & Artigos',
                  description: 'Receba conselhos financeiros práticos',
                  value: Configuracoes.permitirNotificacoesDeDicas,
                  onChanged: (v) async => await Configuracoes.alterarNotificacoesDeDicas(v),
                ),
                SizedBox(height: 24),
                ItemNotificacaoWidget(
                  title: 'Geral',
                  description: 'Receba notificações das atualizações no App',
                  value: Configuracoes.permitirNotificacoesGeral,
                  onChanged: (v) async => await Configuracoes.alterarNotificacoesGeral(v),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
