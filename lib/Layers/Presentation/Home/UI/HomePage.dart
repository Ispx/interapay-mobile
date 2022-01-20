import 'package:flutter/material.dart';
import 'package:interapay/Layers/Presentation/Home/UI/Componentes/MinhasInterasComponent.dart';

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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(flex: 2, child: MinhasInterasComponent()),
              Expanded(flex: 3, child: Center()),
            ],
          ),
        ),
      ),
    );
  }
}
