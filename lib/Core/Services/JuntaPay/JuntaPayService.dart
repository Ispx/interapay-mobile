import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Componentes/BottomSheet.dart';

class JuntaPay {
  const JuntaPay._();

  static Future<T?> bottomSheet<T>({
    required String title,
    required String description,
    void Function()? primaryButtonTap,
    String primaryButtonText = 'Sim',
    void Function()? secondaryButtonTap,
    String secondaryButtonText = 'Não',
  }) async {
    return await Get.bottomSheet(
      JuntaPayBottomSheet(
        title: title,
        description: description,
        primaryButtonTap: primaryButtonTap,
        primaryButtonText: primaryButtonText,
        secondaryButtonTap: secondaryButtonTap,
        secondaryButtonText: secondaryButtonText,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
