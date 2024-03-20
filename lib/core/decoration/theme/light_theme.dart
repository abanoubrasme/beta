import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../services/myServices.dart';
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
  MyServices myServices = Get.find();
  String lang = myServices.sharePref!.get("lang").toString();
  return ThemeData(

      useMaterial3: true,
      fontFamily: lang == "en" ? Font.f1 : Font.f2,

      shadowColor: ColorC.grey,
      canvasColor: ColorC.teal,
      scaffoldBackgroundColor: ColorC.backgroundLight,
      secondaryHeaderColor: ColorC.white,

      focusColor: ColorC.backgroundLight,
      hintColor: ColorC.grey,

      primaryColorLight: ColorC.backgroundLight2,
      primaryColorDark: ColorC.teal,

      bottomSheetTheme: BottomSheetThemeData(
        elevation: 5,
      backgroundColor: ColorC.white,
    ),
      appBarTheme:  const AppBarTheme(
        backgroundColor: ColorC.backgroundLight,
      ),
      dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(color: ColorC.black2,fontSize: 25, fontFamily: lang == "en" ? Font.f1 : Font.f2, ),
          elevation: 0
      ),

      iconTheme:  IconThemeData(
          color: ColorC.teal
      ),
      textTheme: TextTheme(
          headlineSmall  : TextStyle( fontSize: 22, color: ColorC.teal, ),
          headlineMedium : TextStyle( fontSize: 24, color: ColorC.black2, ),
          headlineLarge  : const TextStyle(
              fontSize: 72,
              fontFamily: Font.f3,
              fontWeight: FontWeight.bold,
              color: ColorC.backgroundLight
          ),

          titleSmall  :       TextStyle(fontSize: 20, color: ColorC.grey2,),
          titleMedium : const TextStyle(fontSize: 30, color: ColorC.grey3,),
          titleLarge  : const TextStyle(color: ColorC.amberDark,),

          displaySmall:  TextStyle(fontSize: 22, color: ColorC.black2),

          displayMedium:  TextStyle(fontSize: 24, color: ColorC.teal),
          displayLarge: const TextStyle(
              fontSize: 72,
              fontFamily: Font.f3,
              fontWeight: FontWeight.bold,
              color: ColorC.backgroundLight
          ),

          labelSmall:  TextStyle(color: ColorC.black2,fontSize: 18),
          labelMedium: TextStyle(color: ColorC.black2,fontSize: 26),
          labelLarge: TextStyle(color: ColorC.white2),
    ),

    textButtonTheme:const TextButtonThemeData(
        style: ButtonStyle()
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
        brightness: Brightness.light,

        background: ColorC.backgroundLight,
        onBackground: ColorC.backgroundLight,

        surface: ColorC.backgroundLight,
        onSurface: ColorC.backgroundLight,

        primary: ColorC.backgroundLight,
        onPrimary: ColorC.backgroundLight,

        primaryContainer:  ColorC.backgroundLight3,
        onPrimaryContainer: ColorC.backgroundLight3,

        secondary: ColorC.backgroundLight2,
        onSecondary: ColorC.backgroundLight2,

        secondaryContainer:ColorC.backgroundLight ,
        onSecondaryContainer: ColorC.backgroundLight,

        error: ColorC.redLight,
        onError: ColorC.redLight,
    )

  );
}