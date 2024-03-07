import 'package:beta/core/constant/widget/customText.dart';
import 'package:beta/view/creator/widget/Button/homeButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constant/betaText.dart';
import '../core/decoration/Colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
           Scaffold(
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
                        CustomText(text: "login as admin", fontSize: 22, color: ColorC.grey),
                        const SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 140.0),
                          child: HomeButton(
                            icon: const Icon(
                              Icons.content_paste,
                              color: Colors.teal,
                              size: 60,),
                            page: "/login",
                            width: 80,
                            height: 80,
                            text: 'Login'.tr,),
                        ),
                        const SizedBox(height: 30,),
                        CustomText(text: "login as player", fontSize: 22, color: ColorC.grey),
                        const SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 140.0,),
                          child: HomeButton(
                            icon: const Icon(
                              Icons.content_paste,
                              color: Colors.teal,
                              size: 60,),
                            page: "/codeOfQuiz",
                            width: 80,
                            height: 80,
                            text: 'Play'.tr,),
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
