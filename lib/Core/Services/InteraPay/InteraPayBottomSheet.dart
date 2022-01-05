import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Componentes/AssinaturaWidget.dart';
import '../../Componentes/BottomSheet.dart';

class InteraPayBottomSheet {
  const InteraPayBottomSheet._();

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
      InteraPayBottomSheetWidget(
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
      isScrollControlled: true,
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
      InteraPayBottomSheetWidget.oneButton(
        title: title,
        description: description,
        buttonOnTap: buttonOnTap,
        buttonText: buttonText,
        onCloseButton: onCloseButton,
        showCloseButton: showCloseButton,
        showDragDownWidget: showDragDownWidget,
        customContent: customContent,
      ),
      isScrollControlled: true,
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
      InteraPayBottomSheetWidget.withoutButton(
        title: title,
        description: description,
        onCloseButton: onCloseButton,
        showCloseButton: showCloseButton,
        showDragDownWidget: showDragDownWidget,
        customContent: customContent,
      ),
      isScrollControlled: true,
      ignoreSafeArea: false, // add this
      backgroundColor: Colors.transparent,
    );
  }

  static Future<T?> custom<T>(Widget child) async {
    return await Get.bottomSheet(
      child,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  static Future<T?> showAssinaturas<T>() async {
    return await withoutButton(
      customContent: AssinaturaWidget(),
      showCloseButton: true,
      showDragDownWidget: false,
    );
  }
}
