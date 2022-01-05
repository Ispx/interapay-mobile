import 'package:flutter/material.dart';

import '../../../../../Core/Componentes/ProTagWidget.dart';
import '../../../../../Core/Theme/InteraPayColors.dart';
import '../../../../../Core/Theme/InteraPayFont.dart';

class InteraPayProWidget extends StatelessWidget {
  const InteraPayProWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'InteraPay',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            color: InteraPayColors.baseDark75,
            fontWeight: InteraPayFont.bold,
          ),
        ),
        SizedBox(width: 10),
        ProTagWidget(),
      ],
    );
  }
}