import 'package:beta/core/constant/widget/customText.dart';
import 'package:beta/view/creator/widget/Button/homeButton.dart';
import 'package:beta/core/constant/widget/customButton.dart';
import 'package:beta/view/player/widget/namePlayerTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../control/creator/nameQuizController.dart';
import '../control/player/playerController.dart';
import '../core/constant/betaText.dart';
import '../core/decoration/color.dart';
import '../core/decoration/font.dart';
import '../services/myServices.dart';

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
               title: BeTaText(text: "BeTa", color: ColorC.white, fontSize: 50,),
               centerTitle: true,
               elevation: 0,
               toolbarHeight: 80,
               backgroundColor: ColorC.teal,
               leading:const Text(""),
             ),
            body: Column(
              children: [
                Container(height: 15,),
                Expanded(
                  child:Container(
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
                    child:  ListView(
                      children: [
                        const SizedBox(height: 50,),
                        CustomText(text: "login as admin".tr, fontSize: 22, color: ColorC.grey, padding: EdgeInsets.zero,),
                        const SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 135.0),
                          child: HomeButton(
                            icon: const Icon(
                              Icons.content_paste,
                              color: Colors.teal,
                              size: 60,),
                            width: 80,
                            height: 80,
                            text: 'Login'.tr, onTap: () {Get.toNamed("/login");  },),
                        ),
                        const SizedBox(height: 30,),
                        CustomText(text: "login as player".tr, fontSize: 22, color: ColorC.grey, padding: EdgeInsets.zero,),
                        const SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 135.0,),
                          child: HomeButton(
                            icon: const Icon(
                              Icons.play_lesson_outlined,
                              color: Colors.teal,
                              size: 60,),
                            width: 80,
                            height: 80,
                            text: 'Play'.tr,
                            onTap: (){
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
                        ),
                        const SizedBox(height: 25,),
                      ],
                    ),
                  )
                ),
              ],
            ),
          );
  }
}
