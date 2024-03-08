import 'package:beta/control/creator/quizzesController.dart';
import 'package:beta/core/constant/widget/customText.dart';
import 'package:beta/view/creator/widget/hasData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../core/decoration/Colors.dart';
import '../../../services/myServices.dart';
import '../widget/cardListTitle.dart';

class PageOfQuizzes extends StatelessWidget {
   PageOfQuizzes({super.key});
   QuizzesController quizzesController = Get.put(QuizzesController());
   NameOfQuizController nameOfQuizController=Get.put(NameOfQuizController());
   MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorC.teal,
            elevation: 0,
            title:  CustomText(text:"Main Page".tr, fontSize: 22, color: ColorC.white,),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: (){
                  Get.toNamed("/nameOfQuiz");
                },
                icon: const Icon(Icons.add),
                iconSize: 30,
              )],
            leading: IconButton(icon: const Icon(Icons.arrow_back_outlined),
              color: Colors.white,
              onPressed: () {
                Get.toNamed("/home");
              },),
          ),
          body: FutureBuilder(
            future: quizzesController.getName(myServices.sharePref!.get("id_user").toString()),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if(!snapshot.hasData){
                return const HasData();
              }
              if(snapshot.hasError){
                return const HasData();
              }
              else{
                return GetBuilder<QuizzesController>(
                    builder: (quizzesController){
                      return ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){
                              myServices.sharePref!.setInt("idQuiz",snapshot.data['data'][index]["id_quiz"]);
                              Get.toNamed("/pageOfQuiz",parameters: {
                                // "name_quiz": snapshot.data['data'][index]["name_quiz"]
                              });
                              nameOfQuizController.name = snapshot.data['data'][index]["name_quiz"];
                            },
                            child:GetBuilder<NameOfQuizController>(
                              builder: (nameOfQuizController) {
                                return CardListTitle(
                                  keys:  Key( snapshot.data.toString()),
                                  setIdUser: snapshot.data['data'][index]["id_quiz"],
                                  onPressedDelete: () {
                                    quizzesController.deleteQuiz(myServices.sharePref!.get("idQuiz"));
                                    Get.back();
                                    quizzesController.update();
                                    nameOfQuizController.update();

                                  },
                                  index: index,
                                  nameQuiz: snapshot.data['data'][index]["name_quiz"],);
                              }
                            )

                          );
                        } ,
                      );
                    });
              }
            },
          ),


        );
  }
}




// AnimateIcon(
// key: UniqueKey(),
// onTap: () {},
// iconType: IconType.continueAnimation,
// height: 100,
// width: 100,
// color: Colors.teal,
// animateIcon: AnimateIcons.loading5,
// )