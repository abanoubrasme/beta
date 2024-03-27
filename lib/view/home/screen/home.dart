import 'package:beta/view/home/widget/popupMenuButtonAppBar.dart';
import 'package:beta/view/home/widget/bodyHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../control/player/playerController.dart';
import '../../../core/constant/widget/customText.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';
import '../widget/addNewPlayer.dart';
import '../widget/homeButton.dart';

class Home extends StatelessWidget {
   Home({super.key});

   MyServices myServices = Get.find();
   NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
   PlayerController playerController = Get.put(PlayerController());
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColorDark,
      // appBar:AppBar(
      //   title: CustomText(text:"BeTa", style:context.textTheme.headlineLarge,padding: const EdgeInsets.only(top: 30),),
      //   backgroundColor: context.theme.primaryColorDark.withOpacity(0),
      //   centerTitle: true,
      //   elevation: 0,
      //   toolbarHeight: 100,
      //   leading:const Text(""),
      //   actions: [
      //     PopupMenuButtonAppBar(
      //       text1: 'Setting'.tr,
      //       text2: 'LogOut'.tr,
      //       iconItem1: Icons.settings,
      //       iconItem2: Icons.login,
      //       onSelected:(e){
      //         if(e==1){
      //           Get.toNamed('/setting');
      //         }
      //         if(e==2){
      //           var lang =  myServices.sharePref!.get("lang");
      //           var theme =  myServices.sharePref!.get("theme");
      //           myServices.sharePref!.clear();
      //           myServices.sharePref!.setString("lang",lang.toString());
      //           myServices.sharePref!.setString("theme",theme.toString());
      //           myServices.sharePref!.setString("onBoard","succeed");
      //           Get.offAllNamed('/login');
      //         }
      //       },
      //     )
      //   ],
      // ),
        body: GetBuilder<NameOfQuizController>(
        builder: (nameOfQuizController){
            return BodyHome(
                children: [
                  HomeButton(
                    icon: Icons.content_paste,
                    text: 'Create'.tr,
                    onTap: () {
                      Get.toNamed("/pageOfQuizzes");
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 15),),
                  HomeButton(
                    icon: Icons.play_lesson_outlined,
                    text: 'Play'.tr,
                    onTap: () {
                      AddNewPlayer().alert(context);
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                ],
              );})
    );
  }


}