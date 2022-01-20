import 'package:flutter/material.dart';
import 'package:interapay/Layers/Presentation/interas/components/interasComponent.dart';

class UltimasInterasComponent extends StatelessWidget {
  const UltimasInterasComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InterasComponent(
            nome: 'Isaque Paixão',
            dataDeCriacao: DateTime.now(),
            descricao: 'Compras no Shopping',
            total: 200.00,
          ),
          InterasComponent(
            nome: 'Isaque Paixão',
            dataDeCriacao: DateTime.now(),
            descricao: 'Compras no Shopping',
            total: 200.00,
          ),
          InterasComponent(
            nome: 'Isaque Paixão',
            dataDeCriacao: DateTime.now(),
            descricao: 'Compras no Shopping',
            total: 200.00,
          ),
        ],
      ),
    );
  }
}
