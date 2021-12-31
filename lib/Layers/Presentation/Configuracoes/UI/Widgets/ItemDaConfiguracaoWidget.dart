import 'package:flutter/material.dart';

import '../../../../../Core/Componentes/CardItemWidget.dart';
import '../../../../../Core/Theme/JuntaPayColors.dart';
import '../../ItemDaConfiguracao.dart';

class ItemDaConfiguracaoWidget extends StatelessWidget {
  ItemDaConfiguracaoWidget({
    this.configuracao,
    this.foregroundColor,
    this.iconColor,
    this.onTap,
    this.titleWidget,
    this.valueWidget,
    Key? key,
  })  : assert(() {
          if (configuracao == null && titleWidget == null) {
            throw FlutterError("title 1");
          }

          return true;
        }()),
        super(key: key);

  factory ItemDaConfiguracaoWidget.withColor({
    ItemDaConfiguracao? configuracao,
    required Color color,
    void Function()? onTap,
    Widget? titleWidget,
    Widget? valueWidget,
  }) =>
      ItemDaConfiguracaoWidget(
        configuracao: configuracao,
        foregroundColor: color,
        iconColor: color,
        onTap: onTap,
        titleWidget: titleWidget,
        valueWidget: valueWidget,
      );

  final ItemDaConfiguracao? configuracao;

  final Color? foregroundColor;
  final Color? iconColor;
  final void Function()? onTap;

  /// Usado para substituir o texto no "titulo" do item
  final Widget? titleWidget;

  /// Usado para substituir o texto no "value" do item
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return CardItemWidget(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleWidget ??
              Expanded(
                flex: 2,
                child: Text(
                  configuracao!.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: foregroundColor ?? JuntaPayColors.baseDark75,
                  ),
                ),
              ),
          SizedBox(width: 5),
          if (valueWidget == null) ...{
            Flexible(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (configuracao?.value?.isNotEmpty == true) ...{
                    Expanded(
                      child: Text(
                        configuracao!.value!,
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
          } else ...{
            valueWidget!,
          }
        ],
      ),
    );
  }
}
