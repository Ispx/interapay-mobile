import 'package:flutter/material.dart';

import '../../../../../Core/Componentes/Icons/InteraPayIcons.dart';
import '../../../../../Core/Theme/InteraPayColors.dart';
import '../../../../../Core/Theme/InteraPayFont.dart';

class ItemBeneficioWidget extends StatelessWidget {
  const ItemBeneficioWidget({
    required this.title,
    required this.icon,
    this.size = 20,
    this.color,
    Key? key,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final double size;
  final Color? color;

  factory ItemBeneficioWidget.ad() => ItemBeneficioWidget(title: 'Sem anúncios', icon: InteraPayIcons.ad);
  factory ItemBeneficioWidget.bill() => ItemBeneficioWidget(title: 'Despesas ilimitadas', icon: InteraPayIcons.bill);
  factory ItemBeneficioWidget.group() => ItemBeneficioWidget(title: 'Grupos ilimitados', icon: InteraPayIcons.group);
  factory ItemBeneficioWidget.user() => ItemBeneficioWidget(title: 'Amigos ilimitados', icon: InteraPayIcons.user);
  factory ItemBeneficioWidget.lineChart() => ItemBeneficioWidget(title: 'Relatório das despesas', icon: InteraPayIcons.line_chart);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color ?? Theme.of(context).primaryColor,
          size: size,
        ),
        const SizedBox(width: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: InteraPayColors.baseDark100,
            fontWeight: InteraPayFont.semiBold,
          ),
        ),
      ],
    );
  }
}
