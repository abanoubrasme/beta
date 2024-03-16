import 'package:beta/view/home/widget/appBarHome.dart';
import 'package:beta/view/home/widget/bodyHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../control/player/playerController.dart';
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
      //  backgroundColor: context.theme.hoverColor,
        appBar:AppBarHome(
            text1: 'Setting',
            text2: 'LogOut',
            iconItem1: Icons.settings,
            iconItem2: Icons.login,
             onSelected:(e){
                if(e==1){
                Get.toNamed('/setting');
                }
                if(e==2){
                myServices.sharePref!.clear();
                Get.offAllNamed('/welcome');
                }
                },).buildAppBar(),
        body: BodyHome(
          children: [
            HomeButton(
              icon: const Icon(
                Icons.content_paste,
                color: Colors.teal,
                size: 60,),
              width: 80,
              height: 80,
              text: 'Create'.tr,
              onTap: () {
                Get.toNamed("/pageOfQuizzes");
              }, padding: const EdgeInsets.only(left: 15),),
            HomeButton(
              icon:const Icon(
                Icons.play_lesson_outlined,
                color: Colors.teal,
                size: 60,),
              width: 80,
              height: 80,
              text: 'Play'.tr,
              onTap: () {
                AddNewPlayer().alert();
              },
              padding: const EdgeInsets.only(right: 15),
            ),
          ],
        ),
    );
  }


}