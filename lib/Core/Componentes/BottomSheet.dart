import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'Button.dart';
import '../Services/Router/GetxRouter.dart';
import '../Theme/JuntaPayColors.dart';
import '../Theme/JuntaPayFont.dart';

class JuntaPayBottomSheet extends StatelessWidget {
  const JuntaPayBottomSheet({
    Key? key,
    required this.title,
    required this.description,
    this.primaryButtonText = 'Sim',
    this.secondaryButtonText = 'Não',
    this.primaryButtonTap,
    this.secondaryButtonTap,
  }) : super(key: key);

  final String title;
  final String description;

  final String primaryButtonText;
  final String secondaryButtonText;

  final void Function()? primaryButtonTap;
  final void Function()? secondaryButtonTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          SizedBox(height: 24),
          Flexible(
            child: Text(
              title,
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
          SizedBox(height: 14),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
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
          SizedBox(height: 14),
          ResponsiveRowColumn(
            columnPadding: EdgeInsets.all(20),
            rowPadding: EdgeInsets.all(20),
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rowSpacing: 20,
            layout: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: JuntaPayButton.secondary(
                  title: secondaryButtonText,
                  onTap: () {
                    if (secondaryButtonTap == null) router.back<bool>(result: false);

                    secondaryButtonTap?.call();
                  },
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: JuntaPayButton(
                  title: primaryButtonText,
                  onTap: () {
                    if (primaryButtonTap == null) router.back<bool>(result: true);

                    primaryButtonTap?.call();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
