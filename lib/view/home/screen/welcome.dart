import 'package:beta/core/constant/widget/customText.dart';
import 'package:beta/view/home/widget/addNewPlayer.dart';
import 'package:beta/view/home/widget/bodyWelcome.dart';
import 'package:beta/view/home/widget/homeButton.dart';
import 'package:beta/core/constant/widget/customButton.dart';
import 'package:beta/view/player/widget/namePlayerTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../control/player/playerController.dart';
import '../../../core/constant/betaText.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';

class Welcome extends StatelessWidget {
   Welcome({Key? key}) : super(key: key);

  MyServices myServices = Get.find();
  NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
  PlayerController playerController = Get.put(PlayerController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             backgroundColor: ColorC.teal,
             appBar: AppBar(
               title: BeTaText(text: "BeTa", color: ColorC.white, fontSize: 50, padding: EdgeInsets.zero,),
               centerTitle: true,
               elevation: 0,
               toolbarHeight: 80,
               backgroundColor: ColorC.teal,
               leading:const Text(""),
             ),
             body:BodyWelcome(
                children: [
                  CustomText(text: "login as admin".tr, fontSize: 22, color: ColorC.grey, padding: const EdgeInsets.only(top: 50),),
                  HomeButton(
                    icon: const Icon(
                      Icons.content_paste,
                      color: Colors.teal,
                      size: 60,),
                    width: 80,
                    height: 80,
                    text: 'Login'.tr,
                    onTap: () {Get.toNamed("/login");},
                    padding: const EdgeInsets.symmetric(horizontal: 135.0,vertical: 30),

                  ),
                  CustomText(text: "login as player".tr, fontSize: 22, color: ColorC.grey, padding: EdgeInsets.zero,),
                  HomeButton(
                    width: 80,
                    height: 80,
                    text: 'Play'.tr,
                    padding:const EdgeInsets.symmetric(horizontal: 135.0,vertical: 30),
                    icon: const Icon(
                      Icons.play_lesson_outlined,
                      color: Colors.teal,
                      size: 60,),
                    onTap: (){
                      AddNewPlayer().alert();
                    },
                   ),
                ]
            ),
          );
  }
}
