import 'package:flutter/material.dart';

import '../Theme/JuntaPayFont.dart';

class ProTagWidget extends StatelessWidget {
  const ProTagWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: const Text(
        'PRO',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: JuntaPayFont.bold,
        ),
      ),
    );
  }
}
