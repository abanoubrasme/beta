import 'package:beta/view/creator/widget/customListTile.dart';
import 'package:beta/view/creator/widget/hasData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/quizController.dart';
import '../../../core/constant/widget/customTextButton.dart';
import '../../../core/constant/widget/customText.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';
import '../widget/alertDialog/alertDialogPageQuizzes.dart';
import '../widget/indexQuiz.dart';
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
              style: context.textTheme.labelMedium,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),),
            centerTitle: true,
            actions: [
              buildIconButton(quizController, context)],
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
                            return CustomListTile(
                                keys: Key(snapshot.data["data"].toString()),
                                leading: IndexQuiz(
                                  index: index,
                                  width: 90,
                                  style:   TextStyle(color: ColorC.white,fontSize: 26)),
                                title: Text(
                                  quizController.lengthQuestion(snapshot.data["data"][index]["question"]),
                                  style: TextStyle(color: ColorC.grey2,fontSize: 20),),
                                background: SlideBackground(
                                  color: ColorC.greenDark ,
                                  text:  'Edit'.tr       ,
                                  icon:  Icons.edit      ,
                                  alignment:lang == "en"? Alignment.centerLeft : Alignment.centerRight,
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                ),
                                secondaryBackground: SlideBackground(
                                  color:  ColorC.redDark ,
                                  text:  'Delete'.tr     ,
                                  icon:  Icons.delete   ,
                                  alignment:lang == "en"? Alignment.centerRight : Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(horizontal: 20),

                                ),
                                confirmDismiss: (direction)async{
                                  myServices.sharePref!.setInt("idQuestion",snapshot.data['data'][index]["id_question"]);
                                  if ((lang=="en" || lang=="ar" ) && direction == DismissDirection.endToStart) {
                                    AlertDialogs(
                                        onPressedDelete: () {
                                          quizController.deleteQuestion(myServices.sharePref!.get("idQuestion"));
                                          Get.back();
                                          quizController.update();
                                        },
                                        onPressedCancel:(){
                                          Get.back();
                                        }
                                    ).deleteQuiz(context);
                                  }
                                  else {
                                    Get.toNamed("/editQuiz");
                                  }
                                }

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

  IconButton buildIconButton(QuizController quizController, BuildContext context) {
    return IconButton(
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
                quizController.answerColor = context.theme.canvasColor.value.toString();
                quizController.update();
                Get.toNamed("/quiz");
              },
              icon:  Icon(Icons.add,color: ColorC.grey,),
              iconSize: 30,
            );
  }
}
