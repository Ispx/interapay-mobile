import 'package:flutter/material.dart';

import 'JuntaPayFont.dart';
import 'JuntaPayColors.dart';

class JuntaPayTheme {
  const JuntaPayTheme._();

  static final ThemeData _base = ThemeData(
    brightness: Brightness.light,
    primaryColor: JuntaPayColors.primary,
    primaryColorDark: JuntaPayColors.primaryDark,
    primaryColorLight: JuntaPayColors.primaryLight,
    backgroundColor: JuntaPayColors.background,
    splashColor: JuntaPayColors.primary,
    hoverColor: Colors.transparent,
    scaffoldBackgroundColor: JuntaPayColors.background,
    cardColor: Colors.white,
    iconTheme: IconThemeData(),
    cardTheme: CardTheme(color: Colors.white),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(),
      iconTheme: IconThemeData(),
      color: JuntaPayColors.primary,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: JuntaPayColors.primary,
      elevation: 0,
      focusElevation: 1,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      foregroundColor: Colors.white,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: JuntaPayColors.background,
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: JuntaPayColors.primary,
      secondary: JuntaPayColors.secondary,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 96,
        fontWeight: JuntaPayFont.regular,
        letterSpacing: -1.5,
        decoration: TextDecoration.none,
      ),
      headline2: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 60,
        fontWeight: JuntaPayFont.regular,
        letterSpacing: -0.5,
        decoration: TextDecoration.none,
      ),
      headline3: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 48,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
      headline4: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 34,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 0.25,
        decoration: TextDecoration.none,
      ),
      headline5: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 24,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
      headline6: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 20,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 0.15,
        decoration: TextDecoration.none,
      ),
      subtitle1: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 16,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 0.15,
        decoration: TextDecoration.none,
      ),
      subtitle2: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 14,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 0.1,
        decoration: TextDecoration.none,
      ),
      bodyText1: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 16,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 0.5,
        decoration: TextDecoration.none,
      ),
      bodyText2: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 14,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 0.25,
        decoration: TextDecoration.none,
      ),
      button: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 14,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 1.25,
        decoration: TextDecoration.none,
      ),
      caption: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 12,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 0.4,
        decoration: TextDecoration.none,
      ),
      overline: TextStyle(
        fontFamily: JuntaPayFont.font,
        fontSize: 10,
        fontWeight: JuntaPayFont.medium,
        letterSpacing: 1.5,
        decoration: TextDecoration.none,
      ),
    ),
  );

  static final ThemeData light = _base.copyWith(brightness: Brightness.light);
  static final ThemeData dark = _base.copyWith(
    //TODO: Criar as cores dark
    brightness: Brightness.dark,
    primaryColor: Colors.red,
  );
}
