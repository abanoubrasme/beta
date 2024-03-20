// import 'package:beta/view/creator/widget/TextField/customTextField.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../control/creator/nameQuizController.dart';
// import '../../../core/decoration/font.dart';
// import '../../../core/decoration/color.dart';
// import '../../../services/myServices.dart';
//
// class NameOfQuiz extends StatelessWidget {
//    NameOfQuiz({super.key});
//
//    NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
//    MyServices myServices = Get.find();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorC.teal.withOpacity(.7),
//       body: ListView(
//             children: [
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 90),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         const Text('BeTa',style: TextStyle(
//                             fontSize: 70,
//                             color: Colors.white,
//                             fontFamily:Font.f3 ),),
//                         const SizedBox(height: 10,),
//                        GetBuilder<NameOfQuizController>(
//                            builder: (nameOfQuizController){
//                          return  Container(
//                            decoration: BoxDecoration(
//                                color: Colors.white.withOpacity(.8),
//                                boxShadow: [
//                                  BoxShadow(
//                                    color: Colors.black.withOpacity(0.5),
//                                    spreadRadius: 3,
//                                    blurRadius: 5,
//                                    offset: const Offset(0, 3), // changes position of shadow
//                                  ),
//                                ],
//                                borderRadius: BorderRadius.circular(30)),
//                            padding: const EdgeInsets.all(10),
//                            height: 380,
//                            width: 315,
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: [
//                                const SizedBox(height: 20,),
//                                NameQuizTextField(
//                                  valid: (name){
//                                    return  nameOfQuizController.validatorName(name!, 20, 2);
//                                  },
//                                ),
//                                CodeQuizTextField(
//                                  valid: (code) {
//                                    return nameOfQuizController.validatorName(code!, 6, 4);
//                                  },),
//                                Row(
//                                  children: [
//                                    const SizedBox(width: 15,),
//                                    CreateButton(
//                                      onPressed: () {
//                                        nameOfQuizController.getCode();
//                                        nameOfQuizController.update();
//                                        if(formKey.currentState!.validate()){
//                                          nameOfQuizController.addName(
//                                              nameOfQuizController.name,
//                                              nameOfQuizController.code,
//                                              myServices.sharePref!.get("id_user").toString());
//                                        }
//                                      },),
//                                    const SizedBox(width: 5,),
//                                    const CanselButton(),
//                                  ],
//                                )
//                              ],
//                            ),
//                          );
//                        }),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//
//     );
//   }
//
// }
