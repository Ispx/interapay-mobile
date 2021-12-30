import 'package:flutter/material.dart';

class ItemDaConfiguracao {
  const ItemDaConfiguracao(
    this.title, {
    this.value,
    this.backgroundColor,
  });

  final String title;
  final String? value;
  final Color? backgroundColor;
}
