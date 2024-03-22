import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/myServices.dart';

class ThemeModes extends GetxController{

   late ThemeMode themeMode ;
  MyServices myServices = Get.put(MyServices());

  changeLanguage(String theme){
    myServices.sharePref!.setString("theme", theme);
    if(theme=="dark"){
      themeMode = ThemeMode.dark;
      Get.changeThemeMode(themeMode);
      myServices.sharePref!.setString("theme", "dark");
    }else if(theme == "light"){
      themeMode = ThemeMode.light;
      Get.changeThemeMode(themeMode);
      myServices.sharePref!.setString("theme", "light");
    }
  }


  @override
  void onInit() {

    var themes = myServices.sharePref!.get("theme");
    if(themes == "dark"){
      themeMode = ThemeMode.dark;
    ///  Get.changeThemeMode(themeMode);
    }else if(themes == "light"){
      themeMode = ThemeMode.light;
    ///  Get.changeThemeMode(themeMode) ;
    }else{
      themeMode = ThemeMode.system;
      if(themeMode == ThemeMode.dark){
        myServices.sharePref!.setString("theme", "dark");
      }else{
        myServices.sharePref!.setString("theme", "light");
      }
   ///   Get.changeThemeMode(themeMode) ;
    }
    super.onInit();
  }

}