import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/player/playerController.dart';
import '../../../core/decoration/font.dart';
import '../../../core/decoration/color.dart';

class FinalScore extends StatelessWidget {
   FinalScore({super.key});

  PlayerController playerController = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Get.toNamed("/home");
          playerController.next = 0;
          playerController.rank = 0;
          playerController.totalRank = 0 ;
          playerController.name = "" ;
        },
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 200,),
             Text("${playerController.name}",style: TextStyle(fontSize: 35,fontFamily: Font.f1,color: ColorC.teal),),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 120,),
                Text("Score :  ",style: TextStyle(fontSize: 35,fontFamily: Font.f1,color: ColorC.teal)),
                Text("${playerController.rank}",style: TextStyle(fontSize: 30,fontFamily: Font.f1,color: ColorC.teal)),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 80,),
                Text("Final Score :  ",style: TextStyle(fontSize: 35,fontFamily: Font.f1,color: ColorC.teal)),
                Text("${playerController.totalRank}",style: TextStyle(fontSize: 30,fontFamily: Font.f1,color: ColorC.teal)),
              ],
            ),
          ],),
        ),
      ),
    );
  }
}
