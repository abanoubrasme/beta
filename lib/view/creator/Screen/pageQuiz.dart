import 'package:beta/view/creator/widget/cardView.dart';
import 'package:beta/view/creator/widget/hasData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/quizController.dart';
import '../../../core/constant/widget/customTextButton.dart';
import '../../../core/constant/widget/customText.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';
import '../widget/indexContainer.dart';
import '../widget/nameQuiz.dart';
import '../widget/slideBackground.dart';

class PageOfQuiz extends StatelessWidget {
   PageOfQuiz({super.key});

   MyServices myServices = Get.find();
   QuizController quizController =Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        builder: (quizController){
        String lang = myServices.sharePref!.get("lang").toString();
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 70,
            title:  CustomText(
              text:myServices.sharePref!.getString("nameQuiz").toString(),
              color: ColorC.teal, fontSize: 24, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: (){
                  quizController.question = "";
                  quizController.answer1  = "";
                  quizController.answer2  = "";
                  quizController.answer3  = "";
                  quizController.answer4  = "";
                  quizController.correctAnswer = "Select the Correct answer";
                  quizController.time = 5;
                  quizController.selectIndexTime = 8 ;
                  quizController.selectIndexCorrect = 5 ;
                  quizController.answerColor = ColorC.teal.value.toString();
                  quizController.update();
                  Get.toNamed("/quiz");
                },
                icon:  Icon(Icons.add,color: ColorC.grey,),
                iconSize: 30,
              )],
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new),
              color: ColorC.grey,
              onPressed: () {
                Get.back();
              },),
          ),
          body: FutureBuilder(
            future: quizController.getQuiz(
                myServices.sharePref!.get("id_user").toString(),
                myServices.sharePref!.get("idQuiz").toString()),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if(!snapshot.hasData){
                return  const HasData();
              }
              if(snapshot.hasError){
                return const HasData();
              }
              else{
                return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        myServices.sharePref!.setInt("idQuestion", snapshot.data['data'][index]["id_question"]);
                        String idQuestion = myServices.sharePref!.get("idQuestion").toString();
                        quizController.update();
                        Get.toNamed("/editQuiz");
                      },
                      child:GetBuilder<QuizController>(
                          builder: (quizController){
                            return CardView(
                              keys: Key(snapshot.data["data"].toString()),
                              index:  IndexContainer(index: index, height: 80, width: 80,),
                              label: const Text(""),
                              title:NameQuiz(
                                name: quizController.lengthQuestion(snapshot.data["data"][index]["question"]),
                                titleSize: 22,),
                              background: lang == "en"? SlideBackground(
                                color: ColorC.greenDark,
                                text: 'Edit'.tr,
                                icon: Icons.edit,
                                fontSize: 15,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(top: 13, bottom: 14, left: 30), ):
                              SlideBackground(
                                color: ColorC.redDark,
                                text: 'Delete'.tr,
                                icon: Icons.delete,
                                fontSize: 15,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(top: 13, bottom: 14, right: 30), ),
                              secondaryBackground:lang == "en"? SlideBackground(
                                color: ColorC.redDark,
                                text: 'Delete'.tr,
                                icon: Icons.delete,
                                fontSize: 15,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(top: 13, bottom: 14, right: 30), ):
                              SlideBackground(
                                color: ColorC.greenDark,
                                text: 'Edit'.tr,
                                icon: Icons.edit,
                                fontSize: 15,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(top: 13, bottom: 14, left: 30),),
                              confirmDismiss: (direction) async {
                                if (myServices.sharePref!.get("lang")=="en"){
                                  if (direction == DismissDirection.endToStart) {
                                    myServices.sharePref!.setInt("idQuestion",snapshot.data['data'][index]["id_question"]);
                                    Get.defaultDialog(
                                      titlePadding: EdgeInsets.zero,
                                      title: "",
                                      content: CustomText(
                                        text: "Are you sure you want to delete this question?".tr,
                                        fontSize: 20,
                                        color: ColorC.grey2, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                                      actions: <Widget>[
                                        CustomTextButton(
                                          text: "Cancel".tr,
                                          fontSize: 18,
                                          onPressed: () {
                                            Get.back();
                                          },
                                          color: ColorC.black, padding: EdgeInsets.zero,),
                                        CustomTextButton(
                                          text: "Delete".tr,
                                          fontSize: 18,
                                          color: ColorC.redDark,
                                          onPressed: () {
                                            quizController.deleteQuestion(myServices.sharePref!.get("idQuestion"));
                                            Get.back();
                                            quizController.update();
                                          }, padding: EdgeInsets.zero,)
                                      ],

                                    );
                                  }
                                  else{
                                    Get.toNamed("/editQuiz");
                                  }
                                }else{
                                  if(direction == DismissDirection.startToEnd) {
                                    myServices.sharePref!.setInt("idQuestion",snapshot.data['data'][index]["id_question"]);
                                    Get.defaultDialog(
                                      titlePadding: EdgeInsets.zero,
                                      title: "",
                                      content: CustomText(
                                        text: "Are you sure you want to delete this question?".tr,
                                        fontSize: 20,
                                        color: ColorC.grey2, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                                      actions: <Widget>[
                                        CustomTextButton(
                                          text: "Cancel".tr,
                                          fontSize: 18,
                                          onPressed: () {
                                            Get.back();
                                          },
                                          color: ColorC.black, padding: EdgeInsets.zero,),
                                        CustomTextButton(
                                          text: "Delete".tr,
                                          fontSize: 18,
                                          color: ColorC.redDark,
                                          onPressed: () {
                                            quizController.deleteQuestion(myServices.sharePref!.get("idQuestion"));
                                            Get.back();
                                            quizController.update();
                                          }, padding: EdgeInsets.zero,)
                                      ],

                                    );
                                  }

                                else{
                                  Get.toNamed("/editQuiz");
                                }}
                              },
                            );
                          }),
                    );
                  } ,
                );
              }
            },
          )
      );
    });
  }
}
