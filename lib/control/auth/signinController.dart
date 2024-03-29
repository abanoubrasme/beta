import 'package:beta/services/myServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/link_api.dart';
import '../../model/RequestData.dart';
import 'helperController.dart';

class AuthController extends GetxController {

  RequestData requestData = RequestData();
  MyServices myServices = Get.find();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email    = TextEditingController();
  Helper helper = Get.put(Helper());


  signUp(String userName,String email,String password)async{
    update();
    var response = await requestData.postRequest(linkSignUp, {
      "user_name":userName,
      "email"    :email,
      "password" :password,
    });
    if(response["status"]=="success"){
      myServices.sharePref!.setString("userName", userName);
      myServices.sharePref!.setString("email", email);
      myServices.sharePref!.setString("password", password);
      Get.toNamed("/home",arguments: [getIdUser()]);
    }else{
      getEmail();
      helper.update();
    }
  }
  getIdUser()async{
    var response = await requestData.postRequest(linkGetIdUser, {
      "email"    :email.text,
    });
    if(response["status"]=="success"){
      myServices.sharePref!.setString("id_user", response["data"][0]["id_user"].toString());

    }
  }
  getEmail()async{
    var response = await requestData.postRequest(linkGetUserName, {
      "email"    :email.text,
    });
    if(response["status"]=="success"){
      helper.email_H = response["data"][0]["email"];
      helper.userName_H = response["data"][0]["user_name"];
      update();
    }
  }
  validator (String val ,int max,int min ){

    if(helper.email_H==val||helper.userName_H==val){
      return "the User Name or Email is already exist";
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
  validLogin (bool s){
    if(s){
      return "the user name or password is ";
    }

  }


}