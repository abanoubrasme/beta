import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/link_api.dart';
import '../../model/RequestData.dart';
import '../../services/myServices.dart';

class PlayerController extends GetxController{

  RequestData requestData = RequestData();
  MyServices myServices = Get.find();

  String name = '';
  String code = "";
  List content =[];
  int next = 0 ;
  int rank = 0;
  int totalRank = 0;
  String choose = "";
  TextEditingController nameP = TextEditingController();
  TextEditingController codeP = TextEditingController();

  getCode()async{
    var response = await requestData.postRequest(linkGetCode, {
      "code_quiz" : codeP.text.toString(),
      "name_quiz" : nameP.text.toString(),
    });
    if(response["status"]=="success"){
      code  = response["data"][0]["code_quiz"];
      name  = response["data"][0]["name_quiz"];
      update();
    }
  }

  getCodeCheck(code ,name)async{
    var response = await requestData.postRequest(linkGetCode, {
      "code_quiz" :code.toString(),
      "name_quiz" :name.toString(),
    });
    if(response["status"]=="success"){
      myServices.sharePref!.setInt("idQuiz",response["data"][0]["id_quiz"]) ;
      if(response["data"].length > 0){
        print("============");
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