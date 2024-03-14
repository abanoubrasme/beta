import 'package:beta/control/creator/QuizController.dart';
import 'package:get/get.dart';
import '../core/constant/link_api.dart';
import '../model/RequestData.dart';
import '../services/myServices.dart';

class RDB extends GetxController{


  RequestData requestData = RequestData();
  MyServices myServices = Get.find();
  QuizController quizController = Get.put(QuizController());


  insertData(String idUser,String idQuiz)async{
    var response = await requestData.postRequest(linkInsertData, {
      "question"       :quizController.question.toString(),
      "answer1"        :quizController.answer1.toString(),
      "answer2"        :quizController.answer2.toString(),
      "answer3"        :quizController.answer3.toString(),
      "answer4"        :quizController.answer4.toString(),
      "correct_answer" :quizController.correctAnswer.toString(),
      "time"           :quizController.time.toString(),
      "color"          :quizController.answerColor.toString(),
      "index_color"    :quizController.selectIndexCorrect.toString(),
      "index_time"     :quizController.selectIndexTime.toString(),
      "id_quiz"        :idQuiz.toString(),
      "id_user"        :idUser.toString(),
    });
    if(response["status"]=="success"){
      Get.toNamed("/pageOfQuiz");
    }else{
      print("Sign Up is Fail -----------------------------");
    }
  }
}

