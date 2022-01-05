import 'package:flutter/material.dart';

import '../../../../../Core/Theme/InteraPayFont.dart';
import '../../../../Dominio/Enums/Comuns/Planos.dart';

class PlanoWidget extends StatelessWidget {
  const PlanoWidget({
    Key? key,
    required this.plano,
    this.onTap,
  }) : super(key: key);

  final Planos plano;
  final void Function(Planos)? onTap;

  bool get destaque => plano == Planos.Anual;

  String get title {
    switch (plano) {
      case Planos.Anual:
        return 'R\$ 99,99 por ano';
      case Planos.Mensal:
        return 'R\$ 9,99 por mês';
    }
  }

  String get description {
    switch (plano) {
      case Planos.Anual:
        return 'Economize R\$ 19,00/ano';
      case Planos.Mensal:
        return 'Você pagará R\$ 119,88/ano';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (destaque == true) ...{
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                Text(
                  'Mais vendido',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: InteraPayFont.semiBold,
                  ),
                ),
              ],
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
        },
        Container(
          height: 80,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            borderRadius: destaque
                ? const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )
                : BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: InteraPayFont.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: InteraPayFont.medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
