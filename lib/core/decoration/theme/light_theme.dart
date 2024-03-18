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

ThemeData light(){
  return ThemeData(
    useMaterial3: true,
    fontFamily: Font.f1,

    shadowColor: ColorC.grey,
    primaryColorDark: ColorC.black,
    canvasColor: ColorC.teal,
    scaffoldBackgroundColor: ColorC.backgroundLight,
    primaryColor: ColorC.teal,
    primaryColorLight: ColorC.backgroundLight,
    secondaryHeaderColor: ColorC.white,
  //  colorSchemeSeed: ,
    focusColor: ColorC.teal,

    textButtonTheme:const TextButtonThemeData(
        style: ButtonStyle()
    ),

    appBarTheme:  const AppBarTheme(
      backgroundColor: ColorC.backgroundLight,
    ),

    iconTheme:  IconThemeData(
        color: ColorC.teal
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
          fontSize: 72,
          fontFamily: Font.f3,
          fontWeight: FontWeight.bold,
          color: ColorC.backgroundLight
      ),
      displayMedium:  TextStyle(
          fontSize: 24,
          //fontWeight: FontWeight.bold,
          color: ColorC.teal
      ),
      displaySmall:  TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorC.grey
      ),
      labelSmall:    TextStyle(color: ColorC.grey),
      labelMedium: TextStyle(color: ColorC.grey,fontSize: 25),
      labelLarge: TextStyle(color: ColorC.white2),
      titleSmall:const TextStyle(color: ColorC.amberDark,),
      titleMedium:const TextStyle(color: ColorC.amberDark,),
      titleLarge:const TextStyle(color: ColorC.amberDark,),
    ),

    dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(color: ColorC.teal,fontFamily: Font.f1,fontSize: 25)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:ColorC.teal,
        foregroundColor:ColorC.teal,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    colorScheme:  ColorScheme(
        shadow: ColorC.grey,
        background: ColorC.backgroundLight,
        brightness: Brightness.light,
        primary: ColorC.backgroundLight,
        onPrimary: ColorC.backgroundLight,
        secondary: ColorC.backgroundLight2,
        onSecondary: ColorC.backgroundLight2,
        error: ColorC.redLight,
        onError: ColorC.redLight,
        onBackground: ColorC.backgroundLight,
        surface: ColorC.backgroundLight,
        onSurface: ColorC.backgroundLight),
  );
}