import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';

import '../font.dart';

ThemeData darkTheme(){
  final ThemeData base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(

    scaffoldBackgroundColor: ColorC.backgroundDark,

    canvasColor: ColorC.backgroundDark,
    hoverColor: ColorC.tealDark,

    shadowColor: ColorC.blueLight,
    splashColor: ColorC.tealDark,


    appBarTheme:  const AppBarTheme(
        backgroundColor: ColorC.backgroundDark,
    ),

    buttonTheme:  ButtonThemeData(
        buttonColor: ColorC.white2),

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


    colorScheme:   ColorScheme(
        shadow: ColorC.black,
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

ThemeData dark(){
  return ThemeData(
    useMaterial3: true,
    fontFamily: Font.f1,
    shadowColor: ColorC.black,
    canvasColor: ColorC.tealDark,
    scaffoldBackgroundColor:ColorC.backgroundDark ,
    primaryColor: ColorC.grey,

    focusColor: ColorC.backgroundDark,

    textButtonTheme:const TextButtonThemeData(
        style: ButtonStyle()
    ),
    appBarTheme:   AppBarTheme(
      backgroundColor: ColorC.backgroundDark.withOpacity(0),
    ),
    iconTheme:  IconThemeData(
        color: ColorC.grey
    ),
    textTheme: TextTheme(
      displayLarge:  TextStyle(
        fontSize: 72,
        fontFamily: Font.f3,
        fontWeight: FontWeight.bold,
        color: ColorC.grey
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        //fontWeight: FontWeight.bold,
        color: ColorC.grey
      ),
      displaySmall:  TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorC.grey
      ),
      labelSmall:    TextStyle(color: ColorC.grey),
      labelMedium:  TextStyle(color: ColorC.grey,fontSize: 26),
      labelLarge: TextStyle(color: ColorC.white2),
      titleSmall:const TextStyle(color: ColorC.amberDark,),
      titleMedium:const TextStyle(color: ColorC.amberDark,),
      titleLarge:const TextStyle(color: ColorC.amberDark,),
    ),

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
        titleTextStyle: TextStyle(color: ColorC.grey,fontFamily: Font.f1,fontSize: 22)
    ),

    colorScheme:  ColorScheme(
      shadow: ColorC.black,
      onPrimaryContainer: ColorC.backgroundDark,
      onSecondaryContainer: ColorC.backgroundDark,
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