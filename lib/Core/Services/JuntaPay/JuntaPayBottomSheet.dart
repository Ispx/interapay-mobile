import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Componentes/BottomSheet.dart';

class JuntaPayBottomSheet {
  const JuntaPayBottomSheet._();

  static Future<T?> show<T>({
    String? title,
    String? description,
    void Function()? primaryButtonTap,
    String primaryButtonText = 'Sim',
    void Function()? secondaryButtonTap,
    String secondaryButtonText = 'Não',
    void Function()? onCloseButton,
    bool showCloseButton = false,
    bool showDragDownWidget = true,
    Widget? customContent,
  }) async {
    return await Get.bottomSheet(
      JuntaPayBottomSheetWidget(
        title: title,
        description: description,
        primaryButtonTap: primaryButtonTap,
        primaryButtonText: primaryButtonText,
        secondaryButtonTap: secondaryButtonTap,
        secondaryButtonText: secondaryButtonText,
        onCloseButton: onCloseButton,
        showCloseButton: showCloseButton,
        showDragDownWidget: showDragDownWidget,
        customContent: customContent,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  static Future<T?> withOneButton<T>({
    String? title,
    String? description,
    String buttonText = 'Continuar',
    void Function()? buttonOnTap,
    void Function()? onCloseButton,
    bool showCloseButton = false,
    bool showDragDownWidget = true,
    Widget? customContent,
  }) async {
    return await Get.bottomSheet(
      JuntaPayBottomSheetWidget.oneButton(
        title: title,
        description: description,
        buttonOnTap: buttonOnTap,
        buttonText: buttonText,
        onCloseButton: onCloseButton,
        showCloseButton: showCloseButton,
        showDragDownWidget: showDragDownWidget,
        customContent: customContent,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  static Future<T?> withoutButton<T>({
    String? title,
    String? description,
    void Function()? onCloseButton,
    bool showCloseButton = false,
    bool showDragDownWidget = true,
    Widget? customContent,
  }) async {
    return await Get.bottomSheet(
      JuntaPayBottomSheetWidget.withoutButton(
        title: title,
        description: description,
        onCloseButton: onCloseButton,
        showCloseButton: showCloseButton,
        showDragDownWidget: showDragDownWidget,
        customContent: customContent,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  static Future<T?> custom<T>(Widget child) async {
    return await Get.bottomSheet(
      child,
      backgroundColor: Colors.transparent,
    );
  }
}
