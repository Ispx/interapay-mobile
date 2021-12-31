import 'package:flutter/material.dart';

import '../../Layers/Presentation/Configuracoes/UI/Widgets/PlanoWidget.dart';
import '../../Layers/Presentation/Configuracoes/UI/Widgets/ItemBeneficioWidget.dart';
import 'Icons/JuntaPayIcons.dart';
import '../Theme/JuntaPayColors.dart';
import '../Theme/JuntaPayFont.dart';
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
                color: JuntaPayColors.primary20,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 60,
              width: 60,
              child: Icon(
                JuntaPayIcons.diamond,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Assine o JuntaPay Pro',
              style: TextStyle(
                fontSize: 20,
                color: JuntaPayColors.baseDark100,
                fontWeight: JuntaPayFont.bold,
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
              color: JuntaPayColors.baseDark10,
              height: 1,
              thickness: 1,
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16.0,
                  color: JuntaPayColors.textGray,
                  fontWeight: JuntaPayFont.medium,
                ),
                children: <TextSpan>[
                  const TextSpan(text: 'Se você escolher o JuntaPay Pro agora, você terá '),
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
                color: JuntaPayColors.textGray,
                fontWeight: JuntaPayFont.medium,
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
