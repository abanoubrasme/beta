import 'package:beta/view/home/widget/appBarHome.dart';
import 'package:beta/view/home/widget/bodyHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../control/player/playerController.dart';
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
      backgroundColor: context.theme.focusColor,
      appBar: AppBarHome(
          text1: 'Setting',
          text2: 'LogOut',
          iconItem1: Icons.settings,
          iconItem2: Icons.login,
          color: context.theme.focusColor.withOpacity(0),
          onSelected:(e){
            if(e==1){
              Get.toNamed('/setting');
            }
            if(e==2){
              myServices.sharePref!.clear();
              Get.offAllNamed('/welcome');
            }
          },
        ).buildAppBar(),

        body: BodyHome(
          children: [
            HomeButton(
              icon:  Icon(
                Icons.content_paste, size: 60,
                color: context.theme.primaryColor,),
              width: 80,
              height: 80,
              text: 'Create'.tr,
              onTap: () {
                Get.toNamed("/pageOfQuizzes");
              },
              padding: const EdgeInsets.symmetric(horizontal: 15),),
            HomeButton(
              icon: Icon(
                Icons.play_lesson_outlined,
                color: context.theme.primaryColor,
                size: 60,),
              width: 80,
              height: 80,
              text: 'Play'.tr,
              onTap: () {
                AddNewPlayer().alert();
              },
              padding: const EdgeInsets.symmetric(horizontal: 15),
            ),
          ],
        ),
    );
  }


}