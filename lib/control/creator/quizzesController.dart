import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../core/constant/link_api.dart';
import '../../model/RequestData.dart';

class QuizzesController extends GetxController{

  RequestData requestData = RequestData();

  getName(String idUser)async{
    var response = await requestData.postRequest(linkGetName, {
      "id_user" : idUser.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }

  }
  deleteQuiz(idQuiz)async{
    var response = await requestData.postRequest(linkDeleteQuiz, {
      "id_quiz" :idQuiz.toString(),
    });
    if(response["status"]=="success"){
      return response;
    }else{
      print("Error===================");
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

}