import 'package:flutter/material.dart';

import '../../../../../Core/Componentes/ProTagWidget.dart';
import '../../../../../Core/Theme/JuntaPayColors.dart';
import '../../../../../Core/Theme/JuntaPayFont.dart';

class JuntaPayProWidget extends StatelessWidget {
  const JuntaPayProWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'JuntaPay',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            color: JuntaPayColors.baseDark75,
            fontWeight: JuntaPayFont.bold,
          ),
        ),
        SizedBox(width: 10),
        ProTagWidget(),
      ],
    );
  }
}