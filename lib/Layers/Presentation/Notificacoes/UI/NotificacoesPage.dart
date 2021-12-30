import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/NotificacoesController.dart';
import '../../../../Core/Componentes/AppBar.dart';

class NotificacoesPage extends StatelessWidget {
  NotificacoesController get controller => Get.find<NotificacoesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JuntaPayAppBar(title: 'Notificações'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
