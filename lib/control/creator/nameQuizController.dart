import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/link_api.dart';
import '../../model/RequestData.dart';
import '../../services/myServices.dart';

class NameOfQuizController extends GetxController{

  RequestData requestData = RequestData();
  MyServices myServices = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController codeC = TextEditingController();

   String name = "";
   String code = "";
   String valid = "";

  addName(var name,var code, var idUser)async{
    var response = await requestData.postRequest(linkAddName, {
      "name_quiz": name.toString(),
      "code_quiz": code.toString(),
      "id_user": idUser.toString(),
    });
    if (response["status"] == "success") {
      nameC.text = "";
      codeC.text = "";
    }

  }

  getCode()async{
    var response = await requestData.postRequest(linkGetCode, {
      "code_quiz" : codeC.text.toString(),
      "name_quiz" : nameC.text.toString(),
    });
    if(response["status"]=="success"){
      code = response["data"][0]["code_quiz"];
      name  = response["data"][0]["name_quiz"];
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
        Get.toNamed("/player");
      }
      else{
        Get.toNamed("/pageOfQuiz");
      }
    }
  }


  validatorCode(String text){
    if(text != code.toString()){
      return "Wrong code or name".tr;
    }
  }

  validatorName(String text){
      if(text != name.toString()){
        return "Wrong code or name".tr;
      }
  }

}