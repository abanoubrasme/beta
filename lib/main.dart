import 'package:beta/core/decoration/theme/dark_theme.dart';
import 'package:beta/core/decoration/theme/light_theme.dart';
import 'package:beta/core/localization/changeLanguage.dart';
import 'package:beta/core/localization/translation.dart';
import 'package:beta/core/decoration/theme/themeMode.dart';
import 'package:beta/services/myServices.dart';
import 'package:beta/services/pages.dart';
import 'package:beta/view/auth/Screen/Login.dart';
import 'package:beta/view/home/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  MyServices myServices = Get.put(MyServices());

  @override
  Widget build(BuildContext context) {
    ChangeLanguageController changeLanguageController =Get.put(ChangeLanguageController());
    ThemeModes themeModes =Get.put(ThemeModes());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'BeTa',
      locale: changeLanguageController.language,
      getPages: Pages.pages,
      theme:lightTheme(),
      darkTheme: darkTheme(),
      themeMode: themeModes.themeMode,
      initialRoute: myServices.sharePref!.get("userName") != null? "/home": "/login",
      // home: myServices.sharePref!.get("userName") != null? Home():Login(),
    );
  }
}

// AnimatedSplashScreen(
// splash: const Text(
// 'BeTa',
// style: TextStyle(
// fontSize: 80,
// color: Colors.white,
// fontFamily: "Water_Brush"),
// ),
// nextScreen: myServices.sharePref!.get("userName") != null? Player():Welcome(),
// splashIconSize: 300,
// backgroundColor: Colors.teal,
// )