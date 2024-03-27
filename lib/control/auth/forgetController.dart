import 'package:beta/services/myServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/link_api.dart';
import '../../model/RequestData.dart';
import 'helperController.dart';

class ForgetController extends GetxController {

  RequestData requestData = RequestData();
  MyServices myServices = Get.find();

  final TextEditingController email  = TextEditingController();
  final TextEditingController password  = TextEditingController();
  final TextEditingController confirmPassword  = TextEditingController();

  String emailH = "";
  String userNameH = "";
  String passwordH = "";

  Helper helper = Get.put(Helper());

  getEmail()async{
    var response = await requestData.postRequest(linkGetUserName, {
      "email"    :email.text,
    });
    if(response["status"]=="success"){
      emailH = response["data"][0]["email"];
      userNameH = response["data"][0]["user_name"];
      update();
    }
  }
  validator (String val ,int max,int min ){

    if(emailH == val||userNameH == val){
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
      return "the user name or password are not correct ";
    }

  }

}