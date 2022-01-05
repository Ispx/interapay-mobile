import 'package:flutter/material.dart';

import '../../../../../Core/Componentes/CustomSwitcher.dart';
import '../../../../../Core/Theme/InteraPayColors.dart';
import '../../../../../Core/Theme/InteraPayFont.dart';

class ItemNotificacaoWidget extends StatelessWidget {
  const ItemNotificacaoWidget({
    required this.title,
    required this.description,
    required this.onChanged,
    required this.value,
    Key? key,
  }) : super(key: key);

  final String title;
  final String description;
  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  color: InteraPayColors.baseDark75,
                  fontWeight: InteraPayFont.semiBold,
                ),
              ),
              Container(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: InteraPayColors.baseDark25,
                    fontWeight: InteraPayFont.medium,
                  ),
                ),
                width: 220,
              ),
            ],
          ),
        ),
        CustomSwitcher(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
