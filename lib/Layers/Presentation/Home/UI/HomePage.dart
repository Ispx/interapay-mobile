import 'package:flutter/material.dart';
import 'package:interapay/Layers/Presentation/Home/UI/Componentes/UltimasInterasComponent.dart';
import 'package:interapay/Layers/Presentation/interas/components/interasComponent.dart';

import 'Componentes/HomeAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(saldo: 300),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            UltimasInterasComponent(),
          ],
        ),
      ),
    );
  }
}
