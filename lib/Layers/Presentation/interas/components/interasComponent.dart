import 'package:flutter/material.dart';
import 'package:interapay/Core/Helpers/InteraPayUtils.dart';
import 'package:interapay/Core/Theme/InteraPayColors.dart';
import 'package:interapay/Core/Theme/InteraPayFont.dart';

import 'iconeNomeComponent.dart';

class InterasComponent extends StatelessWidget {
  final String? nome;
  final DateTime? dataDeCriacao;
  final String? descricao;
  final double? total;

  InterasComponent(
      {Key? key,
      required this.nome,
      required this.dataDeCriacao,
      required this.descricao,
      required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: IconeNomeComponent(
            nome: nome,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$descricao',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: InteraPayFont.medium,
                  color: InteraPayColors.baseDark100,
                ),
              ),
              Text(
                '$nome',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: InteraPayFont.regular,
                  color: InteraPayColors.textGray,
                ),
              ),
              Text(
                InteraPayUtils.formatarData(dataDeCriacao!,
                    pattern: 'dd MMM yyyy'),
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: InteraPayFont.regular,
                  color: InteraPayColors.textGray,
                ),
              ),
            ],
          ),
          trailing: Text(
            '+ ${InteraPayUtils.formatarReal(total ?? 0.00)}',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: InteraPayFont.medium,
              color: InteraPayColors.green100,
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
