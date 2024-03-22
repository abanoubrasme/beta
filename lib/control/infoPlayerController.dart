import 'package:get/get.dart';

import '../core/constant/link_api.dart';
import '../model/RequestData.dart';

class InfoPlayerController extends GetxController{

  String userName = "";
  String quizName = "";
  int degree      = 0;
  int finalDegree = 50;
  RequestData requestData = RequestData();

  getInfo(String quizName)async{
    var response = await requestData.postRequest(linkGetInfoPlayer, {
      "quiz_name" : quizName.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }
    else{
      print("error ===============");
    }
  }

  addInfo(String userName,String quizName,int finalDegree ,int degree)async{
    var response = await requestData.postRequest(linkAddInfoPlayer, {
      "user_name"    : userName.toString(),
      "quiz_name"    : quizName.toString(),
      "final_degree" : finalDegree.toString(),
      "degree"       : degree.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }
    else{
      print("error ===============");
    }
  }
}