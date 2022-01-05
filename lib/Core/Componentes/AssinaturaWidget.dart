import 'package:flutter/material.dart';

import '../../Layers/Presentation/Configuracoes/UI/Widgets/PlanoWidget.dart';
import '../../Layers/Presentation/Configuracoes/UI/Widgets/ItemBeneficioWidget.dart';
import 'Icons/InteraPayIcons.dart';
import '../Theme/InteraPayColors.dart';
import '../Theme/InteraPayFont.dart';
import '../../Layers/Dominio/Enums/Comuns/Planos.dart';

class AssinaturaWidget extends StatelessWidget {
  const AssinaturaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: InteraPayColors.primary20,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 60,
              width: 60,
              child: Icon(
                InteraPayIcons.diamond,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Assine o InteraPay Pro',
              style: TextStyle(
                fontSize: 20,
                color: InteraPayColors.baseDark100,
                fontWeight: InteraPayFont.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                ItemBeneficioWidget.ad(),
                const SizedBox(height: 10),
                ItemBeneficioWidget.bill(),
                const SizedBox(height: 10),
                ItemBeneficioWidget.group(),
                const SizedBox(height: 10),
                ItemBeneficioWidget.user(),
                const SizedBox(height: 10),
                ItemBeneficioWidget.lineChart(),
              ],
            ),
            const SizedBox(height: 20),
            Divider(
              color: InteraPayColors.baseDark10,
              height: 1,
              thickness: 1,
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16.0,
                  color: InteraPayColors.textGray,
                  fontWeight: InteraPayFont.medium,
                ),
                children: <TextSpan>[
                  const TextSpan(text: 'Se você escolher o InteraPay Pro agora, você terá '),
                  TextSpan(
                    text: '7 dias de avaliaçao grátis!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const PlanoWidget(plano: Planos.Anual),
            const SizedBox(height: 10),
            Text(
              'ou',
              style: TextStyle(
                fontSize: 16.0,
                color: InteraPayColors.textGray,
                fontWeight: InteraPayFont.medium,
              ),
            ),
            const SizedBox(height: 10),
            const PlanoWidget(plano: Planos.Mensal),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
