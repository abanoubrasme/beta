import 'package:beta/core/constant/widget/customText.dart';
import 'package:beta/view/home/widget/addNewPlayer.dart';
import 'package:beta/view/home/widget/homeButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../control/player/playerController.dart';
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
             backgroundColor:context.theme.primaryColorDark,
             appBar: AppBar(
               title: CustomText(text:"BeTa", style:context.textTheme.headlineLarge,
                 padding: const EdgeInsets.only(top: 30),),
               centerTitle: true,
               elevation: 0,
               toolbarHeight: 120,
               backgroundColor:context.theme.primaryColorDark.withOpacity(0),
               leading:const Text(""),
             ),
             body: Column(
               children: [
                 Container(height: 15,),
                 Expanded(
                     child:Container(
                       decoration:  BoxDecoration(
                           color: context.theme.primaryColor,
                           borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                           boxShadow: [
                             BoxShadow(
                                 color: Colors.black.withOpacity(.3),
                                 spreadRadius: 8,
                                 blurRadius: 7,
                                 offset:  const Offset(5, 1)
                             )
                           ]
                       ),
                       child:  ListView(
                         children: [
                           CustomText(text: "login as admin".tr, style:context.textTheme.headlineMedium, padding: const EdgeInsets.only(top: 50),),
                           HomeButton2(
                             icon: Icons.content_paste,
                             text: 'Login'.tr,
                             onTap: () {Get.toNamed("/login");},
                             padding: const EdgeInsets.symmetric(horizontal: 130,vertical: 30),

                           ),
                           CustomText(text: "login as player".tr, style:context.textTheme.headlineMedium, padding: EdgeInsets.zero,),
                           HomeButton2(
                             text: 'Play'.tr,
                             padding:const EdgeInsets.symmetric(horizontal: 130,vertical: 30),
                             icon: Icons.play_lesson_outlined,
                             onTap: (){
                               AddNewPlayer().alert(context);
                             },
                           ),
                         ],
                       ),
                     )
                 ),
               ],
             )

          );
  }
}
