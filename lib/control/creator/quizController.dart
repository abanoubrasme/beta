import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/link_api.dart';
import '../../core/decoration/color.dart';
import '../../model/RequestData.dart';
import '../../services/myServices.dart';
import 'nameQuizController.dart';

class QuizController extends GetxController{

  late String question ;
  late String answer1  ;
  late String answer2 ;
  late String answer3 ;
  late String answer4 ;
  String correctAnswer = "Select the Correct answer";
  int time = 5 ;
  int selectIndexTime    = 8 ;
  int selectIndexCorrect = 5 ;
  String answerColor = ColorC.teal.value.toString();

  // TextEditingController questionE = TextEditingController();
  // TextEditingController answer1E  = TextEditingController();
  // TextEditingController answer2E  = TextEditingController();
  // TextEditingController answer3E  = TextEditingController();
  // TextEditingController answer4E  = TextEditingController();
  // String correctAnswerE = "Select the Correct answer";
  // int timeE = 5;
  // int selectIndexTimeE = 8 ;
  // int selectIndexCorrectE = 5 ;
  // String answerColorE = ColorC.teal.value.toString();

  NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
  RequestData requestData = RequestData();
  MyServices myServices = Get.find();
  String valid = "" ;

  insertData(String idUser,String idQuiz)async{
    print(question);
    print("======================");
    var response = await requestData.postRequest(linkInsertData,{
      "question"       :question.toString(),
      "answer1"        :answer1.toString(),
      "answer2"        :answer2.toString(),
      "answer3"        :answer3.toString(),
      "answer4"        :answer4.toString(),
      "correct_answer" :correctAnswer.toString(),
      "time"           :time.toString(),
      "color"          :answerColor.toString(),
      "index_color"    :selectIndexCorrect.toString(),
      "index_time"     :selectIndexTime.toString(),
      "id_quiz"        :idQuiz.toString(),
      "id_user"        :idUser.toString(),
    });
    if(response["status"]=="success"){
      print(question);
      print("======================2");
      Get.toNamed("/pageOfQuiz");
    }else{
      print("Sign Up is Fail -----------------------------");
    }
  }
  getData(String question)async{
    var response = await requestData.postRequest(linkGetData2, {
      "question" : question.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }
  }
  getQuiz(String idUser, idQuiz)async{
    var response = await requestData.postRequest(linkGetQuiz, {
      "id_quiz" : idQuiz.toString(),
      "id_user" : idUser.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }
  }
  getIdQuiz()async{
    var response = await requestData.postRequest(linkGetIdQuiz, {
      "name_quiz" :nameOfQuizController.name.toString(),
    });
    if(response["status"]=="success"){
      return response;

    }
  }
  getIdQuestion()async{
    var response = await requestData.postRequest(linkGetIdQuestion, {
      "question" :question.toString(),
    });
    if(response["status"]=="success"){
      return response;

    }
  }
  deleteQuestion(idQuestion)async{
    var response = await requestData.postRequest(linkDeleteQuestion, {
      "id_question" : idQuestion.toString()
    });
    if(response["status"]=="success"){
      return response;
    }else{
      print("error ======== delete");
    }
  }

  String lengthQuestion(String s){
    if(s.length>=25){
      return s.substring(0,25)+("...");}
    else {
      return s;
    }

  }

  }
