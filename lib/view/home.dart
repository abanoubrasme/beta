import 'package:beta/core/constant/betaText.dart';
import 'package:beta/core/constant/widget/customButton.dart';
import 'package:beta/view/player/widget/namePlayerTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../control/creator/nameQuizController.dart';
import '../control/player/playerController.dart';
import '../core/decoration/font.dart';
import '../core/decoration/color.dart';
import '../services/myServices.dart';
import 'creator/widget/Button/homeButton.dart';

class Home extends StatelessWidget {
   Home({super.key});

   MyServices myServices = Get.find();
   NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
   PlayerController playerController = Get.put(PlayerController());
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorC.teal,
        appBar: AppBar(
            title:  Column(
               children: [
                 const SizedBox(height: 40,),
                 BeTaText(text: "BeTa", color: ColorC.white, fontSize: 70,)
                  ],
                ),
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 100,
            backgroundColor: ColorC.teal,
           leading:const Text(""),
           actions: [
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton(
                iconSize: 30,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  onSelected:(e){
                    if(e==1){
                      Get.toNamed('/setting');
                    }
                    if(e==2){
                      myServices.sharePref!.clear();
                      Get.offAllNamed('/welcome');
                    }
                  },
                  elevation: 10,
                  color: Colors.white,
                  itemBuilder: (BuildContext context)=><PopupMenuEntry>[
                     PopupMenuItem(
                        value: 1,
                        child: Row(
                            children: [
                              Icon(Icons.settings,color: Colors.grey[700]),
                              const SizedBox(width: 10,),
                              Text('Setting'.tr,style: TextStyle(color: Colors.grey[700],
                                  fontFamily:myServices.sharePref!.get("lang")=="en"? Font.f1 : Font.f2  ),),
                            ],
                          ),
                    ),
                     PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: [
                            Icon(Icons.login,color: Colors.grey[700]),
                            const SizedBox(width: 10,),
                            Text("LogOut".tr,style: TextStyle(color: Colors.grey[700], fontFamily: Font.f1),),
                          ],
                        )
                    ),
                  ]
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(height: 60,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: Colors.white,
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
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          },),
                        const SizedBox(width: 30,),
                        HomeButton(
                          icon:const Icon(
                          Icons.play_lesson_outlined,
                          color: Colors.teal,
                          size: 60,),
                          width: 80,
                          height: 80,
                          text: 'Play'.tr,
                          onTap: () {
                            Get.defaultDialog(
                              contentPadding: EdgeInsets.zero,
                              title:  "BeTa",
                              titlePadding: const EdgeInsets.symmetric(vertical: 15),
                              titleStyle: TextStyle(fontFamily: Font.f3,fontSize: 50,color: ColorC.teal,fontWeight: FontWeight.w600),
                              content: SizedBox(
                                width: 350,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NamePlayerTextField(
                                      labelText: 'enter your name'.tr,
                                      prefixIcon: const Icon(Icons.person_outline_outlined),
                                      onChanged: (name) {
                                        playerController.name=name;
                                      },
                                    ),
                                    NamePlayerTextField(
                                      labelText: 'enter the code'.tr,
                                      maxLength: 8,
                                      validator: (code) {
                                        return nameOfQuizController.validatorName(code!, 6, 4);
                                      },
                                      onChanged: (code) {
                                        nameOfQuizController.codeC.text = code;
                                        playerController.code = int.parse(code) ;
                                      },
                                      prefixIcon: const Icon(Icons.code),
                                    ),
                                    CustomButton(
                                      onPressed: () {
                                        nameOfQuizController.getCodeCheck(nameOfQuizController.codeC.text);
                                      }, text: 'Connect'.tr,)
                                  ],
                                ),
                              ),

                            );
                          },),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}