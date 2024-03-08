import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/link_api.dart';
import '../../model/RequestData.dart';
import '../../services/myServices.dart';

class NameOfQuizController extends GetxController{

  RequestData requestData = RequestData();
  MyServices myServices = Get.find();

  final TextEditingController nameC = TextEditingController();
  final TextEditingController codeC = TextEditingController();

   String name = "   ";
   int code = 111;
   int valid = 1;

  validatorName (String val ,int max,int min ){
    if(valid.toString()==val){
      return "this code is already existing";
    }
    if(val.isEmpty){
      return "not validator";
    }
    if(val.length>max){
      return "not validator";
    }
    if(val.length<min){
      return "not validator";
    }

  }
  addName(var name,var code, var idUser)async{
    var response = await requestData.postRequest(linkAddName, {
      "name_quiz": name.toString(),
      "code_quiz": code.toString(),
      "id_user": idUser.toString(),
    });
    if (response["status"] == "success") {
      nameC.text = "";
      codeC.text = "";
      Get.toNamed("/pageOfQuizzes");
    } else {
      print("Sign Up is Fail -----------------------------");
    }

  }
  getCode()async{
    var response = await requestData.postRequest(linkGetCode, {
      "code_quiz" :code.toString(),
    });
    if(response["status"]=="success"){
      int val = response["data"][0]["code_quiz"];
      valid = val;
      update();
    }
  }
  getCodeCheck(code)async{
    var response = await requestData.postRequest(linkGetCode, {
      "code_quiz" :code.toString(),
    });
    if(response["status"]=="success"){
      myServices.sharePref!.setInt("idQuiz",response["data"][0]["id_quiz"]) ;
      if(response["data"].length > 0){
        print(response["data"].length);
        Get.toNamed("/player");
      }
      else{
        Get.toNamed("/pageOfQuiz");
      }
    }
  }
}