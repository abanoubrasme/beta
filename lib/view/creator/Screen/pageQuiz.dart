import 'package:beta/view/creator/Screen/pageQuizzes.dart';
import 'package:beta/view/creator/widget/cardView.dart';
import 'package:beta/view/creator/widget/hasData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/quizController.dart';
import '../../../core/constant/widget/customButton.dart';
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
    return GetBuilder<QuizController>(builder: (quizController){
      return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorC.teal,
            title:  CustomText(
              text:myServices.sharePref!.getString("nameQuiz").toString(),
              color: ColorC.white, fontSize: 24,),
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
                icon: const Icon(Icons.add),
                iconSize: 30,
              )],
            leading: IconButton(icon: const Icon(Icons.arrow_back_outlined),
              color: Colors.white,
              onPressed: () {
                Get.to(()=> PageOfQuizzes());
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
                    quizController.question = snapshot.data['data'][index]["question"];
                    return InkWell(
                      onTap: (){
                        quizController.question = snapshot.data['data'][index]["question"];
                        myServices.sharePref!.setString("question", snapshot.data['data'][index]["question"]);
                        myServices.sharePref!.setInt("idQuestion", snapshot.data['data'][index]["id_question"]);
                        quizController.update();
                        Get.toNamed("/editQuiz");
                      },
                      child:GetBuilder<QuizController>(
                          builder: (quizController){
                            return CardView(
                              keys: Key(snapshot.data["data"].toString()),
                              index:  IndexContainer(index: index, height: 80, width: 80,),
                              label: const Text(""),
                              title: NameQuiz(name: snapshot.data["data"][index]["question"], titleSize: 22,),
                              background: SlideBackground(
                                color: ColorC.green,
                                text: 'Edit',
                                icon: Icons.edit,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(top: 12, bottom: 10, left: 30),),
                              secondaryBackground: SlideBackground(
                                color: ColorC.red,
                                text: 'Delete',
                                icon: Icons.delete,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(top: 12, bottom: 10, right: 30),),
                              confirmDismiss: (direction )async{
                                if (direction == DismissDirection.endToStart) {
                                  myServices.sharePref!.setInt("idQuestion",snapshot.data['data'][index]["id_question"]);
                                  Get.defaultDialog(
                                    titlePadding: EdgeInsets.zero,
                                    title: "",
                                    content: CustomText(
                                        text: "Are you sure you want to delete this question?".tr,
                                        fontSize: 20,
                                        color: ColorC.grey2),
                                    actions: <Widget>[
                                      CustomTextButton(
                                        text: "Cancel".tr,
                                        fontSize: 18,
                                        onPressed: () {
                                          Get.back();
                                        },
                                        color: ColorC.black,),
                                      CustomTextButton(
                                        text: "Delete".tr,
                                        fontSize: 18,
                                        color: ColorC.red,
                                        onPressed: () {
                                          quizController.deleteQuestion(myServices.sharePref!.get("idQuestion"));
                                          Get.back();
                                          quizController.update();
                                        },)
                                    ],
                                  );
                                }else{
                                  Get.toNamed("/editQuiz");
                                }
                              },
                            );}),
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
