import 'package:flutter/material.dart';

import '../../../../../Core/Configuracoes.dart';
import '../../../../../Core/Helpers/InteraPayUtils.dart';
import '../../../../../Core/Theme/InteraPayFont.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    Key? key,
    String? nome,
    double? saldo,
  }) : super(key: key) {
    this.nome = nome ?? Configuracoes.nomeDoUsuario;
    this.saldo = saldo ?? Configuracoes.saldoDoUsuario;
  }

  late final String nome;
  String get primeiroNome => nome.split(' ')[0];
  String get primeiraLetraDoUsuario => nome[0];

  late final double saldo;
  String get saldoFormatado => InteraPayUtils.formatarReal(saldo);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      title: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: InteraPayFont.medium,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Boa tarde, '),
                          TextSpan(
                            text: '$primeiroNome!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: InteraPayFont.medium,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Seu saldo é '),
                          TextSpan(
                            text: saldoFormatado,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.notifications_none_rounded,
                    size: 30,
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        primeiraLetraDoUsuario,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      toolbarHeight: preferredSize.height,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
