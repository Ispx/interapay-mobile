import 'package:flutter/material.dart';

import 'InteraPayFont.dart';
import 'InteraPayColors.dart';

class InteraPayTheme {
  const InteraPayTheme._();

  static final ThemeData _base = ThemeData(
    brightness: Brightness.light,
    primaryColor: InteraPayColors.primary,
    primaryColorDark: InteraPayColors.primaryDark,
    primaryColorLight: InteraPayColors.primaryLight,
    backgroundColor: InteraPayColors.background,
    splashColor: InteraPayColors.primary,
    hoverColor: Colors.transparent,
    scaffoldBackgroundColor: InteraPayColors.background,
    cardColor: Colors.white,
    iconTheme: IconThemeData(),
    cardTheme: CardTheme(color: Colors.white),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(),
      iconTheme: IconThemeData(),
      color: InteraPayColors.primary,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: InteraPayColors.primary,
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
      backgroundColor: InteraPayColors.background,
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: InteraPayColors.primary,
      secondary: InteraPayColors.secondary,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 96,
        fontWeight: InteraPayFont.regular,
        letterSpacing: -1.5,
        decoration: TextDecoration.none,
      ),
      headline2: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 60,
        fontWeight: InteraPayFont.regular,
        letterSpacing: -0.5,
        decoration: TextDecoration.none,
      ),
      headline3: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 48,
        fontWeight: InteraPayFont.medium,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
      headline4: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 34,
        fontWeight: InteraPayFont.medium,
        letterSpacing: 0.25,
        decoration: TextDecoration.none,
      ),
      headline5: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 24,
        fontWeight: InteraPayFont.medium,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
      headline6: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 20,
        fontWeight: InteraPayFont.medium,
        letterSpacing: 0.15,
        decoration: TextDecoration.none,
      ),
      subtitle1: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 16,
        fontWeight: InteraPayFont.medium,
        letterSpacing: 0.15,
        decoration: TextDecoration.none,
      ),
      subtitle2: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 14,
        fontWeight: InteraPayFont.medium,
        letterSpacing: 0.1,
        decoration: TextDecoration.none,
      ),
      bodyText1: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 16,
        fontWeight: InteraPayFont.medium,
        letterSpacing: 0.5,
        decoration: TextDecoration.none,
      ),
      bodyText2: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 14,
        fontWeight: InteraPayFont.medium,
        letterSpacing: 0.25,
        decoration: TextDecoration.none,
      ),
      button: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 14,
        fontWeight: InteraPayFont.medium,
        letterSpacing: 1.25,
        decoration: TextDecoration.none,
      ),
      caption: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 12,
        fontWeight: InteraPayFont.medium,
        letterSpacing: 0.4,
        decoration: TextDecoration.none,
      ),
      overline: TextStyle(
        fontFamily: InteraPayFont.font,
        fontSize: 10,
        fontWeight: InteraPayFont.medium,
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
