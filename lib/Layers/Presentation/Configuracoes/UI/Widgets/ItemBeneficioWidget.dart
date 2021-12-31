import 'package:flutter/material.dart';

import '../../../../../Core/Componentes/Icons/JuntaPayIcons.dart';
import '../../../../../Core/Theme/JuntaPayColors.dart';
import '../../../../../Core/Theme/JuntaPayFont.dart';

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

  factory ItemBeneficioWidget.ad() => ItemBeneficioWidget(title: 'Sem anúncios', icon: JuntaPayIcons.ad);
  factory ItemBeneficioWidget.bill() => ItemBeneficioWidget(title: 'Despesas ilimitadas', icon: JuntaPayIcons.bill);
  factory ItemBeneficioWidget.group() => ItemBeneficioWidget(title: 'Grupos ilimitados', icon: JuntaPayIcons.group);
  factory ItemBeneficioWidget.user() => ItemBeneficioWidget(title: 'Amigos ilimitados', icon: JuntaPayIcons.user);
  factory ItemBeneficioWidget.lineChart() => ItemBeneficioWidget(title: 'Relatório das despesas', icon: JuntaPayIcons.line_chart);

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
            color: JuntaPayColors.baseDark100,
            fontWeight: JuntaPayFont.semiBold,
          ),
        ),
      ],
    );
  }
}
