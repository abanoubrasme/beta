import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';

import '../font.dart';

ThemeData lightTheme(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(
   // textTheme: const TextTheme(),
    appBarTheme:  const AppBarTheme(
      backgroundColor: ColorC.backgroundLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:ColorC.tealLight,
        foregroundColor:ColorC.tealLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),

    dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(color:ColorC.black2 ,fontFamily: Font.f1)
    ),

    scaffoldBackgroundColor: ColorC.backgroundLight, 
    colorScheme:  const ColorScheme(
        background: ColorC.backgroundLight, 
        brightness: Brightness.light,
        primary: ColorC.backgroundLight,
        onPrimary: ColorC.backgroundLight,
        secondary: ColorC.backgroundLight,
        onSecondary: ColorC.backgroundLight,
        error: ColorC.redLight,
        onError: ColorC.redLight,
        onBackground: ColorC.backgroundLight,
        surface: ColorC.backgroundLight,
        onSurface: ColorC.backgroundLight),


  );
}