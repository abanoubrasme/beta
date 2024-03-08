import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/link_api.dart';
import '../../core/decoration/Colors.dart';
import '../../model/RequestData.dart';
import '../../services/myServices.dart';
import 'nameQuizController.dart';

class QuizController extends GetxController{
  String question = "";
  String answer1  = "";
  String answer2  = "";
  String answer3  = "";
  String answer4  = "";
  String correctAnswer = "Select the Correct answer".tr;
  int time = 5;
  int selectIndexTime = 8 ;
  int selectIndexCorrect = 5 ;
  String answerColor = ColorC.teal.value.toString();
  TextEditingController questionE =TextEditingController();
  TextEditingController answer1E =TextEditingController();
  TextEditingController answer2E =TextEditingController();
  TextEditingController answer3E =TextEditingController();
  TextEditingController answer4E =TextEditingController();
  String correctAnswerE = "Select the Correct answer".tr;
  int timeE = 5;
  int selectIndexTimeE = 8 ;
  int selectIndexCorrectE = 5 ;
  String answerColorE = ColorC.teal.value.toString();

  NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
  QuizController quizController = Get.put(QuizController());
  GlobalKey<FormState> formKey  = GlobalKey<FormState>();
  RequestData requestData = RequestData();
  MyServices myServices = Get.find();

  String valid = "" ;

  insertData(String idUser,String idQuiz)async{
    var response = await requestData.postRequest(linkInsertData, {
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
      print("1=====================");
      print(quizController.question);
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
      "question" :quizController.question.toString(),
    });
    if(response["status"]=="success"){
      return response;

    }
  }

  }
