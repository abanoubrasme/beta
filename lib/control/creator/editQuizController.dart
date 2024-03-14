import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/link_api.dart';
import '../../core/decoration/color.dart';
import '../../model/RequestData.dart';
import 'quizController.dart';

class EditQuizController extends GetxController{

  // String question = "";
  // String answer1  = "";
  // String answer2  = "";
  // String answer3  = "";
  // String answer4  = "";
  // String correctAnswer = "Select the Correct answer";
  // int time = 5;
  // int selectIndexTime = 8 ;
  // int selectIndexCorrect = 5 ;
  // String answerColor = ColorC.teal.value.toString();

  TextEditingController questionE =TextEditingController();
  TextEditingController answer1E  =TextEditingController();
  TextEditingController answer2E  =TextEditingController();
  TextEditingController answer3E  =TextEditingController();
  TextEditingController answer4E  =TextEditingController();
  String correctAnswerE = "Select the Correct answer";
  int timeE = 5;
  int selectIndexTimeE = 8 ;
  int selectIndexCorrectE = 5 ;
  String answerColorE = ColorC.teal.value.toString();

  QuizController quizController = Get.put(QuizController());
  RequestData requestData = RequestData();

  updateData(String idQuestion) async {
    var response = await requestData.postRequest(linkUpdateData, {
      "question"       :quizController.question,
      "answer1"        :quizController.answer1,
      "answer2"        :quizController.answer2,
      "answer3"        :quizController.answer3,
      "answer4"        :quizController.answer4,
      "correct_answer" :quizController.correctAnswer.toString(),
      "time"           :quizController.time.toString(),
      "color"          :quizController.answerColor.toString(),
      "index_color"    :quizController.selectIndexCorrect.toString(),
      "index_time"     :quizController.selectIndexTime.toString(),
      "id_question"    :idQuestion.toString()
    });
    if(response["status"]=="success"){
      return response;
    }else{
      print("Sign Up is Fail -----------------------------");
    }
  }
  updateCorrectAnswer(String idQuestion,String correctAnswer,String color,int selectIndexColor) async {
    var response = await requestData.postRequest(linkUpdateAnswer, {
      "color"            :color.toString(),
      "index_color"      :selectIndexColor.toString(),
      "correct_answer"   :correctAnswer.toString(),
      "id_question"      :idQuestion.toString()
    });
    if(response["status"]=="success"){
      return response;
    }if(response["status"]=="fail"){
      print("Sign Up is Fail -----------------------------");
    }
  }

  updateQuestion(String idQuestion, var new_, var column) async {
    var response = await requestData.postRequest(linkUpdateQuestion, {
      "column"            :column.toString(),
      "new_"              :new_.toString(),
      "id_question"       :idQuestion.toString()
    });
    if(response["status"]=="success"){
      return response;
    }
    if(response["status"]=="fail"){
      print("Sign Up is Fail -----------------------------");
    }
  }

  getAllData(String idQuestion)async{
    var response = await requestData.postRequest(linkGetData2, {
      "id_question" : idQuestion.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }
  }

}