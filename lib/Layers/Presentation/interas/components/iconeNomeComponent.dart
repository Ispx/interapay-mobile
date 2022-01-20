import 'package:flutter/material.dart';
import 'package:interapay/Core/Theme/InteraPayColors.dart';
import 'package:interapay/Core/Theme/InteraPayFont.dart';

class IconeNomeComponent extends StatelessWidget {
  final String? nome;
  const IconeNomeComponent({Key? key, required this.nome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: InteraPayColors.background,
      ),
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(
        nome?[0] ?? '',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: InteraPayFont.medium,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
