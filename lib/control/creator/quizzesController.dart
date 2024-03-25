import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/link_api.dart';
import '../../model/RequestData.dart';
import '../../services/myServices.dart';

class QuizzesController extends GetxController{

  RequestData requestData = RequestData();
  MyServices myServices = Get.find();


  final TextEditingController nameC = TextEditingController();
  final TextEditingController codeC = TextEditingController();
  final TextEditingController nameE = TextEditingController();

  int updates = 0;
  String name = "";
  String nameEdit = "";
  String code = "";

  String valid = "";


  getName(String idUser)async{
    var response = await requestData.postRequest(linkGetName, {
      "id_user" : idUser.toString(),
    });
    if (response["status"] == "success"){
      name = response["data"][0]["name_quiz"];
      return response;
    }else{

    }
  }
  deleteQuiz(idQuiz)async{
    var response = await requestData.postRequest(linkDeleteQuiz, {
      "id_quiz" :idQuiz.toString(),
    });
    if(response["status"]=="success"){
      update();
      return response;
    }
  }
  getAllData(String idUser)async{
    var response = await requestData.postRequest(linkGetData, {
      "id_user" : idUser.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }
  }
  addName(String name,String code, String idUser)async{
    var response = await requestData.postRequest(linkAddName, {
      "name_quiz": name.toString(),
      "code_quiz": code.toString(),
      "id_user"  : idUser.toString(),
    });
    if (response["status"] == "success") {
      nameC.text = "";
      codeC.text = "";
    }
  }

  getCode()async{
    var response = await requestData.postRequest(linkGetCode, {
      "code_quiz" :codeC.text.toString(),
      "name_quiz" :nameC.text.toString(),
    });
    if(response["status"]=="success"){
      code = response["data"][0]["code_quiz"];
      name = response["data"][0]["name_quiz"];
      if(name == nameC.text && code == codeC.text){
        valid = code;
      }
      print(code);
      print(name);
      update();
    }
  }

  getCode2(codes , names)async{
    var response = await requestData.postRequest(linkGetCode, {
      "code_quiz" :codes.toString(),
      "name_quiz" :names.toString(),
    });
    if(response["status"]=="success"){
      code = response["data"][0]["code_quiz"];
      name = response["data"][0]["name_quiz"];
      if(name == names && code == codes){
        valid = name;
      }
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

  updateName(idQuiz)async{
   var response = await requestData.postRequest(linkUpdateName, {
     "name_quiz" : nameEdit.toString(),
     "id_quiz" : idQuiz.toString()
   });
   if(response["status"]=="success"){
     return response;
   }
  }

  validatorName (String text ,int max,int min ){
    if(text == valid ){
        return "this name or code are already existing".tr;
    }

    if(text.isEmpty){
      return "The field is empty. It should not be empty".tr ;
    }
    if(text.length>max){
      return "${"the maximum is".tr} $max";
    }
    if(text.length<min){
      return "${"the minimum is".tr} $min";
    }
  }

  validatorNameEdit(String text){
    if(text == valid ){
      return "this name is already existing".tr;
    }
  }

}