import 'dart:math';
import 'package:beta/control/creator/quizzesController.dart';
import 'package:beta/core/constant/widget/customText.dart';
import 'package:beta/view/creator/widget/addNewQuiz.dart';
import 'package:beta/view/creator/widget/hasData.dart';
import 'package:beta/view/creator/widget/nameQuiz.dart';
import 'package:beta/view/creator/widget/returnToBack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/widget/customTextButton.dart';
import '../../../core/decoration/color.dart';
import '../../../core/decoration/font.dart';
import '../../../services/myServices.dart';
import '../widget/TextField/nameQuizTextField.dart';
import '../widget/cardView.dart';
import '../widget/indexContainer.dart';
import '../widget/editNameTextField.dart';
import '../widget/showCode.dart';
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
           // backgroundColor:ColorC.white2,
            elevation: 0,
            toolbarHeight: 70,
            title:CustomText(text:"Main Page".tr, fontSize: 22, color: ColorC.teal, padding: const EdgeInsets.symmetric(horizontal: 0),),
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
                        return InkWell(
                            onTap: () {
                              myServices.sharePref!.setInt("idQuiz", snapshot.data['data'][index]["id_quiz"]);
                              Get.toNamed("/pageOfQuiz");
                              myServices.sharePref!.setString("nameQuiz", snapshot.data['data'][index]["name_quiz"]) ;
                            },
                            child: GetBuilder<QuizzesController>(
                                builder: (quizzesController){
                                  return  CardView(
                                    keys: Key(snapshot.data.toString()),
                                    index: IndexContainer(index: index, height: 90, width: 90,),
                                    title: NameQuiz(name: snapshot.data['data'][index]["name_quiz"], titleSize: 25,),
                                    label: ShowCode(code:snapshot.data['data'][index]["code_quiz"].toString() ),
                                    background: lang == "en"?
                                    SlideBackground(
                                      color: ColorC.greenDark,
                                      text: 'Edit'.tr,
                                      icon: Icons.edit,
                                      fontSize: 16,
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(top: 16, bottom: 18, left: 30), ):
                                    SlideBackground(
                                      color: ColorC.redDark,
                                      text: 'Delete'.tr,
                                      icon: Icons.delete,
                                      fontSize: 16,
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.only(top: 16, bottom: 18, right: 30), ),
                                    secondaryBackground:lang == "en"?
                                    SlideBackground(
                                    color: ColorC.redDark,
                                    text: 'Delete'.tr,
                                    icon: Icons.delete,
                                      fontSize: 16,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(top: 16, bottom: 18, right: 30),):
                                    SlideBackground(
                                      color: ColorC.greenDark,
                                      text: 'Edit'.tr,
                                      icon: Icons.edit,
                                      fontSize: 16,
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(top: 16, bottom: 18, left: 30), ),
                                    confirmDismiss: (direction) async {
                                        myServices.sharePref!.setInt("idQuiz", snapshot.data['data'][index]["id_quiz"]);
                                        if (lang=="en") {
                                          if(direction == DismissDirection.endToStart){
                                            Get.defaultDialog(
                                              titlePadding: EdgeInsets.zero,
                                              title: "",
                                              content: CustomText(
                                                text: "Are you sure you want to delete this quiz?".tr,
                                                fontSize: 22,
                                                color: ColorC.grey2, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                                              actions: <Widget>[
                                                CustomTextButton(
                                                  text: "Cancel".tr,
                                                  fontSize: 20,
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  color: ColorC.black, padding: EdgeInsets.zero,),
                                                CustomTextButton(
                                                  text: "Delete".tr,
                                                  fontSize: 20,
                                                  color: ColorC.redDark,
                                                  onPressed: () {
                                                    quizzesController.deleteQuiz(myServices.sharePref!.get("idQuiz"));
                                                    Get.back();
                                                    quizzesController.update();
                                                  }, padding: EdgeInsets.zero,)
                                              ],
                                            );
                                          }
                                          else {
                                            myServices.sharePref!.setInt("idQuiz",snapshot.data['data'][index]["id_quiz"])  ;
                                            int? idQuiz = myServices.sharePref!.getInt("idQuiz") ;
                                            WidgetsBinding.instance.addPersistentFrameCallback((_) {
                                              quizzesController.nameE.text = snapshot.data?['data'][index]["name_quiz"]??"";
                                            });
                                            Get.defaultDialog(
                                              barrierDismissible: false,
                                              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                                              title: "Edit name quiz".tr,
                                              titleStyle: const TextStyle(fontFamily: Font.f1),
                                              titlePadding: const EdgeInsets.symmetric(vertical: 15),
                                              content: SizedBox(
                                                width: 350,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CustomText(
                                                      text:snapshot.data["data"][index]["name_quiz"],
                                                      fontSize: 20, color: ColorC.grey2,
                                                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),),
                                                    EditNameTextField(
                                                      labelText: 'quiz name'.tr,
                                                      onChanged:(name){
                                                        quizzesController.name = name;
                                                      },
                                                      icon: const Icon(Icons.drive_file_rename_outline),
                                                      maxLength: 20,
                                                      keyboardType: TextInputType.name,
                                                      padding: const EdgeInsets.only(top: 10,bottom: 20),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        CustomTextButton(
                                                          text: "Cancel".tr,
                                                          fontSize: 20,
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          color: ColorC.redDark,
                                                          padding: EdgeInsets.symmetric(horizontal: 35),),
                                                        CustomTextButton(
                                                          text: "Edit".tr,
                                                          fontSize: 20,
                                                          color: ColorC.greenDark,
                                                          onPressed: () {
                                                            quizzesController.updateName(idQuiz);
                                                            quizzesController.update();
                                                            Get.back();
                                                            quizzesController.update();
                                                          }, padding: EdgeInsets.symmetric(horizontal: 35),
                                                        ),
                                                      ],)
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                        }
                                        else{
                                          if(direction == DismissDirection.startToEnd){
                                            Get.defaultDialog(
                                              titlePadding: EdgeInsets.zero,
                                              title: "",
                                              content: CustomText(
                                                text: "Are you sure you want to delete this quiz?".tr,
                                                fontSize: 22,
                                                color: ColorC.grey2, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                                              actions: <Widget>[
                                                CustomTextButton(
                                                  text: "Cancel".tr,
                                                  fontSize: 20,
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  color: ColorC.black, padding: EdgeInsets.symmetric(horizontal: 35),),
                                                CustomTextButton(
                                                  text: "Delete".tr,
                                                  fontSize: 20,
                                                  color: ColorC.redDark,
                                                  onPressed: () {
                                                    quizzesController.deleteQuiz(myServices.sharePref!.get("idQuiz"));
                                                    Get.back();
                                                    quizzesController.update();
                                                  }, padding: EdgeInsets.symmetric(horizontal: 35),)
                                              ],
                                            );
                                          }
                                          else {
                                            myServices.sharePref!.setInt("idQuiz",snapshot.data['data'][index]["id_quiz"])  ;
                                            int? idQuiz = myServices.sharePref!.getInt("idQuiz") ;
                                            WidgetsBinding.instance.addPersistentFrameCallback((_) {
                                              quizzesController.nameE.text = snapshot.data?['data'][index]["name_quiz"]??"";
                                            });
                                            Get.defaultDialog(
                                              barrierDismissible: false,
                                              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                                              title: "Edit name quiz".tr,
                                              titleStyle: const TextStyle(fontFamily: Font.f1),
                                              titlePadding: const EdgeInsets.symmetric(vertical: 15),
                                              content: SizedBox(
                                                width: 350,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CustomText(
                                                      text:snapshot.data["data"][index]["name_quiz"],
                                                      fontSize: 20, color: ColorC.grey2,
                                                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),),
                                                    EditNameTextField(
                                                      labelText: 'quiz name'.tr,
                                                      onChanged:(name){
                                                        quizzesController.name = name;
                                                      },
                                                      icon: const Icon(Icons.drive_file_rename_outline),
                                                      maxLength: 20,
                                                      keyboardType: TextInputType.name,
                                                      padding: EdgeInsets.zero,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        CustomTextButton(
                                                          text: "Cancel".tr,
                                                          fontSize: 20,
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          color: ColorC.redDark,
                                                          padding: const EdgeInsets.symmetric(horizontal: 35),),
                                                        CustomTextButton(
                                                          text: "Edit".tr,
                                                          fontSize: 20,
                                                          color: ColorC.greenDark,
                                                          onPressed: () {
                                                            quizzesController.updateName(idQuiz);
                                                            quizzesController.update();
                                                            Get.back();
                                                            quizzesController.update();
                                                          }, padding: const EdgeInsets.symmetric(horizontal: 35),
                                                        ),
                                                      ],)
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                        }
                                    },
                                  );
                                }),
                              );
                        } ,
                );
              }
            },
          ),
        );
        });
  }
}
