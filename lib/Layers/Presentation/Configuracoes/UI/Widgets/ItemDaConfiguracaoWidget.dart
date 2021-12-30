import 'package:flutter/material.dart';

import '../../../../../Core/Theme/JuntaPayColors.dart';
import '../../ItemDaConfiguracao.dart';

class ItemDaConfiguracaoWidget extends StatelessWidget {
  const ItemDaConfiguracaoWidget({
    required this.configuracao,
    this.foregroundColor,
    this.iconColor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  factory ItemDaConfiguracaoWidget.withColor(ItemDaConfiguracao configuracao, Color color, {void Function()? onTap}) => ItemDaConfiguracaoWidget(
        configuracao: configuracao,
        foregroundColor: color,
        iconColor: color,
        onTap: onTap,
      );

  final ItemDaConfiguracao configuracao;

  final Color? foregroundColor;
  final Color? iconColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                configuracao.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  color: foregroundColor ?? JuntaPayColors.baseDark75,
                ),
              ),
            ),
            SizedBox(width: 5),
            Flexible(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (configuracao.value?.isNotEmpty == true) ...{
                    Expanded(
                      child: Text(
                        configuracao.value!,
                        maxLines: 2,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18, color: JuntaPayColors.baseDark25),
                      ),
                    ),
                    SizedBox(width: 5),
                  },
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: iconColor ?? Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
