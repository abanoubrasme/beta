import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../services/myServices.dart';
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

  MyServices myServices = Get.find();
  String lang = myServices.sharePref!.get("lang").toString();
  return ThemeData(
    useMaterial3: true,
    fontFamily: lang == "en" ? Font.f1 : Font.f2,

    canvasColor: ColorC.tealDark, // used to index quiz  ColorC.teal
    scaffoldBackgroundColor:ColorC.backgroundDark ,  // ColorC.backgroundLight
    secondaryHeaderColor: ColorC.grey3, // used
    focusColor: ColorC.backgroundDark3,  //not used
    hintColor: ColorC.grey2, // used

    primaryColorLight: ColorC.backgroundDark3,
    primaryColorDark: ColorC.backgroundDark3,

    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(color: ColorC.grey,fontSize: 22, fontFamily: lang == "en" ? Font.f1 : Font.f2),
      elevation: 0,
    ),
    appBarTheme:   AppBarTheme(
      backgroundColor: ColorC.backgroundDark.withOpacity(0),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 5,

     // backgroundColor: ColorC.amberDark,
    ),
    iconTheme:  IconThemeData(
        color: ColorC.white
    ),
    textTheme: TextTheme(

      headlineSmall  : TextStyle( fontSize: 20, color: ColorC.white, ),
      headlineMedium : TextStyle( fontSize: 24, color: ColorC.white, ),
      headlineLarge  :  TextStyle(
          fontSize: 72,
          fontFamily: Font.f3,
          fontWeight: FontWeight.bold,
          color: ColorC.white
      ),

      titleSmall  : TextStyle(fontSize: 20,color: ColorC.white),
      titleMedium : TextStyle(fontSize: 30, color: ColorC.white),
      titleLarge  : const TextStyle(color: ColorC.amberDark,),

      displaySmall:  TextStyle(fontSize: 22, color: ColorC.white),
      displayMedium: TextStyle(fontSize: 24, color: ColorC.grey),
      displayLarge:  TextStyle(
        fontSize: 72,
        fontFamily: Font.f3,
        fontWeight: FontWeight.bold,
        color: ColorC.white
      ),

      labelSmall:    TextStyle(color: ColorC.grey,fontSize: 18),
      labelMedium:  TextStyle(color: ColorC.grey,fontSize: 26),
      labelLarge: TextStyle(color: ColorC.white2),



    ),
    textButtonTheme:const TextButtonThemeData(
        style: ButtonStyle()
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:ColorC.tealDark,
        foregroundColor:ColorC.tealDark,
       // splashFactory: NoSplash.splashFactory,
        elevation: 0,
        //shadowColor: Colors.transparent,
      ),
    ),

    colorScheme:  ColorScheme(
      scrim: ColorC.amberDark,
      shadow: ColorC.black,
      background: ColorC.backgroundDark,
      onBackground:ColorC.backgroundDark,

      surface: ColorC.backgroundDark3,
      onSurface: ColorC.backgroundDark3,

      brightness: Brightness.dark,

      primary: ColorC.backgroundDark3,
      onPrimary: ColorC.backgroundDark3,

      primaryContainer: ColorC.backgroundDark3,
      onPrimaryContainer: ColorC.backgroundDark3,

      secondary: ColorC.backgroundDark3,
      onSecondary:ColorC.backgroundDark3,

      secondaryContainer: ColorC.backgroundDark3,
      onSecondaryContainer: ColorC.backgroundDark3,

      error: ColorC.redDark,
      onError: ColorC.redDark,


    ),
  );
}