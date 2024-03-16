import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';

import '../font.dart';

ThemeData darkTheme(){
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    scaffoldBackgroundColor: ColorC.backgroundDark,

    canvasColor: ColorC.backgroundDark,
    hoverColor: ColorC.tealDark,

    appBarTheme:  const AppBarTheme(
        backgroundColor: ColorC.backgroundDark,
    ),

    buttonTheme:  ButtonThemeData(
        buttonColor: ColorC.white2),

    useMaterial3: true,

    textButtonTheme:  const TextButtonThemeData(style: ButtonStyle(

    )),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:ColorC.tealDark,
        foregroundColor:ColorC.tealDark,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),

    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(color:ColorC.white2 ,fontFamily: Font.f1)
    ),

    textTheme: TextTheme(
      labelSmall: const TextStyle(color: ColorC.amberDark),
      labelMedium: const TextStyle(color: ColorC.amberDark),
        labelLarge: TextStyle(color: ColorC.white2),
      titleSmall:const TextStyle(color: ColorC.amberDark,),
      titleMedium:const TextStyle(color: ColorC.amberDark,),
      titleLarge:const TextStyle(color: ColorC.amberDark,),
    ),


    colorScheme:  const ColorScheme(
        background: ColorC.backgroundDark,
        brightness: Brightness.dark,
        primary: ColorC.backgroundDark,
        onPrimary: ColorC.backgroundDark,
        secondary: ColorC.backgroundDark,
        onSecondary:ColorC.backgroundDark,
        error: ColorC.redDark,
        onError: ColorC.redDark,
        onBackground:ColorC.backgroundDark,
        surface: ColorC.backgroundDark,
        onSurface: ColorC.backgroundDark,
    ),
  );
}