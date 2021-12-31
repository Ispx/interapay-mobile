import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'Button.dart';
import '../Services/Router/GetxRouter.dart';
import '../Theme/JuntaPayColors.dart';
import '../Theme/JuntaPayFont.dart';

class JuntaPayBottomSheetWidget extends StatelessWidget {
  const JuntaPayBottomSheetWidget({
    Key? key,
    this.title,
    this.description,
    this.primaryButtonText = 'Sim',
    this.secondaryButtonText = 'Não',
    this.primaryButtonTap,
    this.secondaryButtonTap,
    this.showDragDownWidget = true,
    this.showCloseButton = false,
    this.onCloseButton,
    this.customContent,
  }) : super(key: key);

  final String? title;
  final String? description;

  final String? primaryButtonText;
  final String? secondaryButtonText;

  final void Function()? primaryButtonTap;
  final void Function()? secondaryButtonTap;
  final void Function()? onCloseButton;

  final bool showDragDownWidget;
  final bool showCloseButton;

  final Widget? customContent;

  factory JuntaPayBottomSheetWidget.withoutButton({
    String? title,
    String? description,
    bool showDragDownWidget = true,
    bool showCloseButton = false,
    void Function()? onCloseButton,
    Widget? customContent,
  }) =>
      JuntaPayBottomSheetWidget(
        title: title,
        description: description,
        primaryButtonText: null,
        secondaryButtonText: null,
        showDragDownWidget: showDragDownWidget,
        showCloseButton: showCloseButton,
        onCloseButton: onCloseButton,
        customContent: customContent,
      );

  factory JuntaPayBottomSheetWidget.oneButton({
    String? title,
    String? description,
    String buttonText = 'Continuar',
    void Function()? buttonOnTap,
    bool showDragDownWidget = true,
    bool showCloseButton = false,
    void Function()? onCloseButton,
    Widget? customContent,
  }) =>
      JuntaPayBottomSheetWidget(
        title: title,
        description: description,
        primaryButtonText: buttonText,
        primaryButtonTap: buttonOnTap,
        secondaryButtonText: null,
        showDragDownWidget: showDragDownWidget,
        showCloseButton: showCloseButton,
        onCloseButton: onCloseButton,
        customContent: customContent,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: JuntaPayColors.primary40,
              borderRadius: BorderRadius.circular(50),
            ),
            height: 5,
            width: 50,
          ),
          if (showCloseButton == true) ...{
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  if (onCloseButton == null) {
                    router.back();
                  } else {
                    onCloseButton!.call();
                  }
                },
                constraints: const BoxConstraints(),
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                padding: EdgeInsets.only(right: 24, left: 24),
                icon: Icon(
                  Icons.close,
                  size: 24,
                  color: JuntaPayColors.baseDark75,
                ),
              ),
            ),
          },
          if (title?.isNotEmpty == true || description?.isNotEmpty == true) ...{
            const SizedBox(height: 20),
          },
          if (customContent == null) ...{
            if (title?.isNotEmpty == true) ...{
              Flexible(
                child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    color: JuntaPayColors.baseDark100,
                    fontWeight: JuntaPayFont.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            },
            if (description?.isNotEmpty == true) ...{
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Text(
                    description!,
                    textAlign: TextAlign.center,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: JuntaPayColors.textGray,
                      fontWeight: JuntaPayFont.medium,
                    ),
                  ),
                ),
              ),
            },
            if (primaryButtonText == null && secondaryButtonText == null) ...{
              const SizedBox(height: 40),
            },
          } else ...{
            customContent!,
          },
          if (primaryButtonText != null || secondaryButtonText != null) ...{
            ResponsiveRowColumn(
              columnPadding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
              rowPadding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              rowSpacing: 20,
              layout: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
              children: [
                if (secondaryButtonText?.isNotEmpty == true) ...{
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: JuntaPayButton.secondary(
                      title: secondaryButtonText!,
                      onTap: () {
                        if (secondaryButtonTap == null) router.back<bool>(result: false);

                        secondaryButtonTap?.call();
                      },
                    ),
                  ),
                },
                if (primaryButtonText?.isNotEmpty == true) ...{
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: JuntaPayButton(
                      title: primaryButtonText!,
                      onTap: () {
                        if (primaryButtonTap == null) router.back<bool>(result: true);

                        primaryButtonTap?.call();
                      },
                    ),
                  ),
                },
              ],
            ),
          },
        ],
      ),
    );
  }
}
