import 'package:flutter/material.dart';
import 'package:interapay/Core/Theme/InteraPayFont.dart';
import 'package:interapay/Layers/Presentation/interas/components/interasComponent.dart';

class MinhasInterasComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Últimas Interas',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: InteraPayFont.medium,
                  fontFamily: InteraPayFont.font,
                ),
              ),
              Row(
                children: [
                  Text(
                    'ver todas',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: InteraPayFont.medium,
                      fontFamily: InteraPayFont.font,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
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
            ),
          ),
        )
      ],
    );
  }
}
