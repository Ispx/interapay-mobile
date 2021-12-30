import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Dominio/Enums/Comuns/Moeda.dart';
import '../Controllers/MoedasController.dart';
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
              Container(
                color: Colors.white,
                child: ListView.custom(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childrenDelegate: SliverChildListDelegate.fixed(
                    Moeda.values.map((e) => Text('teste')).toList(),
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
