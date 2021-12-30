
import 'package:flutter/material.dart';

import '../Theme/JuntaPayColors.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({required this.checked, Key? key}) : super(key: key);

  final bool checked;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 30,
      width: 30,
      curve: Curves.linear,
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: checked == true ? Theme.of(context).primaryColor : Colors.transparent,
        shape: BoxShape.circle,
        border: checked == false ? Border.all(color: JuntaPayColors.baseDark10) : null,
      ),
      child: checked == true
          ? Icon(
              Icons.check,
              color: Colors.white,
              size: 20,
            )
          : SizedBox(),
    );
  }
}
