import 'package:beta/control/creator/quizzesController.dart';
import 'package:beta/core/constant/widget/customText.dart';
import 'package:beta/view/creator/widget/alertDialog/addNewQuiz.dart';
import 'package:beta/view/creator/widget/alertDialog/alertDialogPageQuizzes.dart';
import 'package:beta/view/creator/widget/hasData.dart';
import 'package:beta/view/creator/widget/returnToBack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';
import '../widget/customListTile.dart';
import '../widget/indexQuiz.dart';
import '../widget/slideBackground.dart';

class PageOfQuizzes extends StatelessWidget {
   PageOfQuizzes({super.key});

   QuizzesController quizzesController = Get.put(QuizzesController());
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
        builder: (quizzesController){
          String lang = myServices.sharePref!.get("lang").toString();
        return   Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 70,
            title: CustomText(
              text:"Main Page".tr,
              style: context.textTheme.labelMedium,
              padding: const EdgeInsets.symmetric(horizontal: 0),),
            centerTitle: true,
            actions: [
             AddNewQuiz()
            ],
            leading:  Back(page: "/home"),
          ),
          body: FutureBuilder(
            future: quizzesController.getName(myServices.sharePref!.get("id_user").toString()),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if(!snapshot.hasData){
                return const HasData();
              }
              else{
                return ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, index){
                        return GetBuilder<QuizzesController>(
                            builder: (quizzesController){
                              return CustomListTile(
                                  onTap: () {
                                    myServices.sharePref!.setInt("idQuiz", snapshot.data['data'][index]["id_quiz"]);
                                    Get.toNamed("/pageOfQuiz");
                                    myServices.sharePref!.setString("nameQuiz", snapshot.data['data'][index]["name_quiz"]) ;
                                  },
                                  keys:  Key(snapshot.data["data"][index].toString()),
                                  leading: IndexQuiz(
                                    index: index,
                                    width: 90,
                                    style: TextStyle(color: ColorC.white,fontSize: 28)),
                                  trailing: IconButton(
                                    icon:  Icon(Icons.info_outline,color: ColorC.grey,),
                                    onPressed: (){
                                      myServices.sharePref!.setString("quizName", snapshot.data["data"][index]["name_quiz"].toString());
                                      Get.toNamed("/info");
                                    },),
                                  title:Text(
                                    snapshot.data['data'][index]["name_quiz"],
                                    style: context.textTheme.labelMedium,),
                                  subtitle: Text(snapshot.data["data"][index]["code_quiz"].toString(),
                                    style:context.textTheme.labelSmall ,),
                                  background: SlideBackground(
                                    color: ColorC.greenDark ,
                                    text:  'Edit'.tr       ,
                                    icon:  Icons.edit      ,
                                    alignment:lang == "en"? Alignment.centerLeft : Alignment.centerRight,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                  secondaryBackground: SlideBackground(
                                    color:  ColorC.redDark ,
                                    text:  'Delete'.tr     ,
                                    icon:  Icons.delete   ,
                                    alignment:lang == "en"? Alignment.centerRight : Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                  confirmDismiss: (direction)async{
                                    myServices.sharePref!.setInt("idQuiz", snapshot.data['data'][index]["id_quiz"]);
                                      if ((lang=="en" || lang=="ar" ) && direction == DismissDirection.endToStart) {
                                             AlertDialogs(
                                                 onPressedDelete: () {
                                                   quizzesController.deleteQuiz(myServices.sharePref!.get("idQuiz"));
                                                   Get.back();
                                                   quizzesController.update();
                                                 },
                                                 onPressedCancel:(){
                                                   Get.back();
                                                 }
                                             ).deleteQuiz(context);
                                      }
                                      else {
                                          myServices.sharePref!.setInt("idQuiz",snapshot.data['data'][index]["id_quiz"])  ;
                                          int? idQuiz = myServices.sharePref!.getInt("idQuiz") ;
                                          WidgetsBinding.instance.addPersistentFrameCallback((_) {
                                          quizzesController.nameE.text = snapshot.data?['data'][index]["name_quiz"]??"";});
                                          AlertDialogs(
                                            onPressedCancel: (){
                                              Get.back();
                                            },
                                            onPressedEdit: () {
                                              quizzesController.updateName(idQuiz);
                                              quizzesController.update();
                                              Get.back();
                                              quizzesController.update();
                                          },
                                            onChangedEdit: (name){
                                              quizzesController.name = name;
                                            }
                                          ).editNameQuiz(snapshot, index,context);}
                                      }
                              ) ;
                            });
                        } ,
                );
              }
            },
          ),
        );
        });
  }
}
