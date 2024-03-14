import 'dart:math';
import 'package:beta/control/creator/quizzesController.dart';
import 'package:beta/core/constant/widget/customText.dart';
import 'package:beta/view/creator/widget/hasData.dart';
import 'package:beta/view/creator/widget/nameQuiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/widget/customButton.dart';
import '../../../core/decoration/color.dart';
import '../../../core/decoration/font.dart';
import '../../../services/myServices.dart';
import '../widget/TextField/nameQuizTextField.dart';
import '../widget/cardView.dart';
import '../widget/indexContainer.dart';
import '../widget/nameEditTextField.dart';
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
        return   Scaffold(
          appBar: AppBar(
            backgroundColor: ColorC.teal,
            elevation: 0,
            title:CustomText(text:"Main Page".tr, fontSize: 22, color: ColorC.white, padding: const EdgeInsets.symmetric(horizontal: 0),),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: (){
                  Get.defaultDialog(
                      barrierDismissible: false,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                        title: "Add new quiz",
                        titleStyle: const TextStyle(fontFamily: Font.f1),
                        titlePadding:  const EdgeInsets.symmetric(vertical: 15),
                        content: GetBuilder<QuizzesController>(
                            builder: (quizzesController){
                          return  SizedBox(width: 350,
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 20,),
                                  NameQuizTextField(
                                    labelText: 'quiz name',
                                    controller: quizzesController.nameC,
                                    valid: (name){
                                      return  quizzesController.validatorName(name!, 20, 2);
                                    },
                                    onChanged: (name) {
                                      quizzesController.name = name ;
                                     // quizzesController.update();
                                    }, icon: const Icon(Icons.drive_file_rename_outline),
                                    maxLength: 20,
                                    keyboardType: TextInputType.name,
                                  ),
                                  const SizedBox(height: 10,),
                                  NameQuizTextField(
                                    labelText: 'quiz code',
                                    controller: quizzesController.codeC,
                                    valid: (code) {
                                      return quizzesController.validatorName(code!, 6, 4);
                                    },
                                    onChanged:(code) {
                                      if(code.isEmpty){
                                        quizzesController.code = Random().nextInt(10000)+100000;
                                        quizzesController.getCode();
                                      }else{
                                        quizzesController.code = int.parse(code)  ;
                                        quizzesController.getCode();
                                      }
                                    },
                                    icon: const Icon(Icons.code),
                                    maxLength: 8,
                                    keyboardType: TextInputType.number,
                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    CustomTextButton(
                                      text: "Cancel".tr,
                                      fontSize: 20,
                                      onPressed: (){
                                        Get.back();
                                      },
                                      color: ColorC.red,),
                                    const SizedBox(width: 70,),
                                    CustomTextButton(
                                      text: "Create".tr,
                                      fontSize: 20,
                                      onPressed: () {
                                        quizzesController.getCode();
                                        quizzesController.update();
                                        if(formKey.currentState!.validate()){
                                          var idUser =  myServices.sharePref!.get("id_user").toString();
                                          quizzesController.addName(quizzesController.name, quizzesController.code, idUser);
                                          Get.back();
                                          quizzesController.update();
                                        }
                                        quizzesController.update();
                                      },
                                      color: ColorC.green,),
                                  ],)
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                },
                icon: const Icon(Icons.add),
                iconSize: 30,
              )],
            leading: IconButton(icon: const Icon(Icons.arrow_back_outlined),
              color: Colors.white,
              onPressed: () {
                Get.offAllNamed("/home");
              },),
          ),
          body: FutureBuilder(
            future: quizzesController.getName(myServices.sharePref!.get("id_user").toString()),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if(!snapshot.hasData){
                return const HasData();
              }
              if(snapshot.hasError){
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
                                    background: SlideBackground(
                                      color: ColorC.green,
                                      text: 'Edit',
                                      icon: Icons.edit,
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(top: 18, bottom: 20, left: 30),),
                                    secondaryBackground: SlideBackground(
                                    color: ColorC.red,
                                    text: 'Delete',
                                    icon: Icons.delete,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(top: 18, bottom: 20, right: 30),),
                                    confirmDismiss:(direction)async{
                                        myServices.sharePref!.setInt("idQuiz", snapshot.data['data'][index]["id_quiz"]);
                                        if (direction == DismissDirection.endToStart) {
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
                                                color: ColorC.black,),
                                              CustomTextButton(
                                                text: "Delete".tr,
                                                fontSize: 20,
                                                color: ColorC.red,
                                                onPressed: () {
                                                  quizzesController.deleteQuiz(myServices.sharePref!.get("idQuiz"));
                                                  Get.back();
                                                  quizzesController.update();
                                                },)
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
                                            title: "Edit name quiz",
                                            titleStyle: const TextStyle(fontFamily: Font.f1),
                                            titlePadding: const EdgeInsets.symmetric(vertical: 15),
                                            content: SizedBox(
                                              width: 350,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(height: 10,),
                                                  CustomText(
                                                    text:snapshot.data["data"][index]["name_quiz"], fontSize: 20, color: ColorC.grey2, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                                                  const SizedBox(height: 10,),
                                                  NameEditTextField(
                                                    labelText: 'quiz name',
                                                    onChanged:(name){
                                                      quizzesController.name = name;
                                                      print(quizzesController.name);
                                                    },
                                                    icon: const Icon(Icons.drive_file_rename_outline),
                                                    maxLength: 20,
                                                    keyboardType: TextInputType.name,
                                                  ),
                                                  const SizedBox(height: 20,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      CustomTextButton(
                                                        text: "Cancel".tr,
                                                        fontSize: 20,
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: ColorC.red,),
                                                      const SizedBox(
                                                        width: 70,),
                                                      CustomTextButton(
                                                        text: "Edit".tr,
                                                        fontSize: 20,
                                                        color: ColorC.green,
                                                        onPressed: () {
                                                          quizzesController.updateName(idQuiz);
                                                          quizzesController.update();
                                                          Get.back();
                                                          quizzesController.update();
                                                        },
                                                      ),
                                                    ],)
                                                ],
                                              ),
                                            ),
                                          );
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




// AnimateIcon(
// key: UniqueKey(),
// onTap: () {},
// iconType: IconType.continueAnimation,
// height: 100,
// width: 100,
// color: Colors.teal,
// animateIcon: AnimateIcons.loading5,
// )