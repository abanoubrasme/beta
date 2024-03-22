import 'package:beta/control/settingController.dart';
import 'package:beta/core/localization/changeLanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/myServices.dart';
import '../decoration/color.dart';
import '../decoration/theme/themeMode.dart';

class Setting extends StatelessWidget {
   Setting({super.key});
   MyServices myServices = Get.put(MyServices());
   SettingController settingController = Get.put(SettingController());
   ChangeLanguageController localeController = Get.put(ChangeLanguageController());
   ThemeModes themeModes =Get.put(ThemeModes());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorC.white.withOpacity(0),
        title: Text("Setting".tr,
          style: context.textTheme.headlineMedium,),
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: ColorC.grey2,
        ),
      ),
      body:  GetBuilder<SettingController>(
        builder: (settingController){
          return  ListView(
            children: [
              ListTile(
                title:  Text("Language".tr,style: context.textTheme.titleSmall),
                leading:  Icon(Icons.language,color:ColorC.grey2),
                onTap: (){
                  if(myServices.sharePref!.get("lang")=="ar"){
                    settingController.checkBoxAR = true;
                    settingController.checkBoxEN = false;
                  }else if(myServices.sharePref!.get("lang")=="en"){
                    settingController.checkBoxEN = true;
                    settingController.checkBoxAR = false;
                  }else {
                    if( Get.deviceLocale!.languageCode.toString()=="ar"){
                      settingController.checkBoxAR  = true;
                      settingController.checkBoxEN = false;
                    }
                    if( Get.deviceLocale!.languageCode.toString()=="en"){
                      settingController.checkBoxEN = true;
                      settingController.checkBoxAR = false;
                    }
                  }
                  Get.bottomSheet(
                      GetBuilder<SettingController>(
                          builder: (settingController){
                        return  Container(
                          height: 180,
                          decoration:   BoxDecoration(
                            color: context.theme.secondaryHeaderColor,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    height: 5,
                                    width: 60,
                                  ),
                                ),),

                                 Padding(
                                   padding:  const EdgeInsets.symmetric(horizontal: 8),
                                   child: Card(
                                     elevation: 0,
                                     child: CheckboxListTile(
                                         title: Text("english",style: context.textTheme.displaySmall,),
                                       activeColor: ColorC.greenDark,
                                       value: settingController.checkBoxEN,
                                       onChanged: (value) {
                                        if(settingController.checkBoxEN==false){
                                          settingController.checkBoxEN = true;
                                          settingController.checkBoxAR = false;
                                          localeController.changeLanguage("en");
                                          settingController.update();
                                      }
                                     },
                             ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 8),
                                   child: Card(
                                     elevation: 0,
                                     child: CheckboxListTile(
                                       title:  Text("arabic".tr,style: context.textTheme.displaySmall),
                                       activeColor: ColorC.greenDark,
                                       value:  settingController.checkBoxAR,
                                       onChanged: (value) {
                                         if(settingController.checkBoxAR==false){
                                           settingController.checkBoxAR = true;
                                           settingController.checkBoxEN = false;
                                           localeController.changeLanguage("ar");
                                           settingController.update();
                                       }
                                       },
                                     ),
                                   ),
                                 ),
                            ],
                          ),
                        );
                      })
                  );
                },
              ),
              ListTile(
                title: Text(themeModes.themeMode == ThemeMode.light ? "Dark Mode" : "Light Mode",style: context.textTheme.titleSmall),
                leading: Icon(themeModes.themeMode == ThemeMode.light ? Icons.dark_mode_outlined : Icons.light_mode_outlined
                    ,color:ColorC.grey2),
                onTap: (){
                  myServices.sharePref!.get("theme");
                  if(themeModes.themeMode == ThemeMode.light) {
                    themeModes.changeLanguage("dark");
                  }else if(themeModes.themeMode == ThemeMode.dark){
                    themeModes.changeLanguage("light");
                  }
                },
              )
            ],
          );
        },
      )

    );
  }
}
