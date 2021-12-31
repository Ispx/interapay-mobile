import 'package:flutter/material.dart';

import '../Theme/JuntaPayColors.dart';
import '../Theme/JuntaPayFont.dart';

class JuntaPayButton extends StatelessWidget {
  const JuntaPayButton({
    Key? key,
    required this.title,
    this.textStyle,
    this.foregroundColor = Colors.white,
    this.backgroundColor,
    this.onTap,
    this.size,
  }) : super(key: key);

  final String title;
  final TextStyle? textStyle;

  final Color foregroundColor;
  final Color? backgroundColor;

  final Size? size;

  final void Function()? onTap;

  factory JuntaPayButton.secondary({
    required String title,
    Color? backgroundColor,
    Color? foregroundColor,
    void Function()? onTap,
    Size? size,
    TextStyle? textStyle,
  }) {
    return JuntaPayButton(
      title: title,
      backgroundColor: JuntaPayColors.primary20,
      foregroundColor: JuntaPayColors.primary,
      onTap: onTap,
      size: size,
      textStyle: textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: textStyle ??
            TextStyle(
              fontFamily: JuntaPayFont.font,
              fontSize: 18,
              fontWeight: JuntaPayFont.bold,
              letterSpacing: 0.5,
              decoration: TextDecoration.none,
              color: foregroundColor,
            ),
      ),
      onPressed: onTap,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide.none,
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size?>(size ?? Size(double.infinity, 55)),
        overlayColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.1)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return Colors.grey;

          return backgroundColor ?? Theme.of(context).primaryColor;
        }),
      ),
    );
  }
}
