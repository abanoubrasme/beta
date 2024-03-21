import 'dart:async';
import 'package:beta/view/creator/widget/hasData.dart';
import 'package:beta/view/player/widget/buttonTimePlayer.dart';
import 'package:beta/view/player/widget/multiChoosePlayer.dart';
import 'package:beta/view/player/widget/questionPlayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';
import '../../../../control/creator/quizController.dart';
import '../../../../control/creator/nameQuizController.dart';
import '../../../../core/decoration/color.dart';
import '../../../control/player/playerController.dart';
import '../../../services/myServices.dart';
import '../widget/rankBox.dart';

class Player extends StatelessWidget {
  Player({super.key});

  QuizController quizController =Get.put(QuizController());
  NameOfQuizController nameOfQuizController =Get.put(NameOfQuizController());
  PlayerController playerController = Get.put(PlayerController());
  CountdownController controller =  CountdownController(autoStart: true);

  MyServices myServices = Get.find();
 int next = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
                centerTitle: true,
                title: Text(playerController.nameP.text,style: TextStyle(color: ColorC.grey2),),
                actions: [
                  MaterialButton(
                      onPressed: (){
                        Get.offAllNamed("/home");
                      },
                      child:   Text("Cancel".tr,
                        style:  TextStyle(color: ColorC.grey2, fontSize: 17),
                      )),
                ],
              ),
        body:FutureBuilder(
            future: quizController.getQuiz(
                myServices.sharePref!.get("id_user").toString(),
                myServices.sharePref!.get("idQuiz").toString()),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              playerController.content=[];
              playerController.next = 0;
              int len =snapshot.data?["data"].length?? 0;
              playerController.totalRank = len;
              if(playerController.content.isEmpty){
                for(int i =0;i<len;i++){
                  playerController.content.add(snapshot.data["data"][i]["id_question"]);
                }
              }
              if(!snapshot.hasData){
                return  const HasData();
              }
              if(snapshot.hasError){
                return  const HasData();
              }
              else{
               return GetBuilder<PlayerController>(
                   builder: (playerController){
                     return PageView.builder(
                       itemCount: 1,
                       itemBuilder: (context,index){
                          int time = snapshot.data["data"][playerController.next]['time'];
                         // Timer(
                         //   Duration(seconds: snapshot.data["data"][playerController.next]['time']),
                         //         () {
                         //         if(playerController.next<playerController.content.length-1){
                         //           playerController.next++;
                         //           playerController.update();
                         //         }else{
                         //           Get.offAllNamed("/home");
                         //           playerController.next = 0;
                         //         }
                         //   },
                         // );
                         return ListView(
                           children: [
                             ButtonTimePlayer(
                               time: time,
                               controller: controller,
                               onFinished:  () {
                                 if(playerController.next<playerController.content.length-1){
                                        playerController.next++;
                                          time = snapshot.data["data"][playerController.next]['time'];
                                          controller.restart();
                                        playerController.update();}
                                      else{
                                        Get.offAllNamed("/home");
                                        playerController.next = 0;
                                      }

                                      playerController.update();
                               }
                             ),
                             QuestionPlayer(
                               question: snapshot.data["data"][playerController.next]['question'],),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 children: [
                                   Row(
                                     children: [
                                       MultiChoosePlayer(
                                         ke:1,
                                         color: ColorC.redDark,
                                         answer: snapshot.data["data"][playerController.next]['answer1'],
                                         onTap: () {
                                           playerController.choose=snapshot.data["data"][playerController.next]['answer1'];
                                           if(playerController.choose==snapshot.data["data"][playerController.next]['correct_answer']){
                                             playerController.rank++;
                                           }
                                           if(playerController.next<playerController.content.length-1){
                                             playerController.next++;
                                             time = snapshot.data["data"][playerController.next]['time'];
                                             controller.restart();
                                           }else{
                                             Get.offNamed("/finalScore");
                                             playerController.next = 0;
                                           }

                                           playerController.update();

                                         },),
                                       MultiChoosePlayer(
                                         ke:2,
                                         color: ColorC.amberDark,
                                         answer: snapshot.data["data"][playerController.next]['answer2'],
                                         onTap: () {
                                           playerController.choose=snapshot.data["data"][playerController.next]['answer2'];
                                           if(playerController.choose==snapshot.data["data"][playerController.next]['correct_answer']){
                                             playerController.rank++;
                                           }
                                           if(playerController.next<playerController.content.length-1){
                                             playerController.next++;
                                             time = snapshot.data["data"][playerController.next]['time'];
                                             controller.restart();
                                           }
                                           else{
                                             Get.offNamed("/finalScore");
                                             playerController.next = 0;
                                           }
                                           playerController.update();
                                         },),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       MultiChoosePlayer(
                                         ke: 3,
                                         color:ColorC.blueDark,
                                         answer: snapshot.data["data"][playerController.next]['answer3'],
                                         onTap: () {
                                           playerController.choose=snapshot.data["data"][playerController.next]['answer3'];
                                           if(playerController.choose==snapshot.data["data"][playerController.next]['correct_answer']){
                                             playerController.rank++;
                                           }
                                           if(playerController.next<playerController.content.length-1){
                                             playerController.next++;
                                             time = snapshot.data["data"][playerController.next]['time'];
                                             controller.restart();
                                           }else{
                                             Get.offNamed("/finalScore");
                                             playerController.next = 0;
                                           }

                                           playerController.update();
                                         },),
                                       MultiChoosePlayer(
                                         ke:4,
                                         color : ColorC.greenDark,
                                         answer: snapshot.data["data"][playerController.next]['answer4'],
                                         onTap: () {
                                           playerController.choose=snapshot.data["data"][playerController.next]['answer4'];
                                           if(playerController.choose==snapshot.data["data"][playerController.next]['correct_answer']){
                                             playerController.rank++;
                                           }
                                           if(playerController.next<playerController.content.length-1){
                                             playerController.next++;
                                             time = snapshot.data["data"][playerController.next]['time'];
                                             controller.restart();
                                           }else{
                                             Get.offNamed("/finalScore");
                                             playerController.next = 0;
                                           }
                                           playerController.update();
                                         },),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(bottom: 12,right: 15,left: 15,top: 7),
                               child: Row(
                                 children: [
                                   RankBox(total: playerController.rank, text: 'ٍScore'.tr,),
                                   const SizedBox(width: 15,),
                                   RankBox(total: playerController.totalRank, text: 'Total'.tr,),]
                               )
                             )
                           ],
                         );

                       },
                     );
                   });

              }

        })
            );


  }
}
