import 'package:beta/core/constant/onBoardList.dart';
import 'package:beta/core/constant/widget/customTextButton.dart';
import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/onBoardController.dart';
import '../../services/myServices.dart';


 class onBoarding extends StatelessWidget {
    onBoarding({super.key});

   OnBoardController onBoardController =Get.put(OnBoardController());
    MyServices myServices = Get.put(MyServices());

    @override
   Widget build(BuildContext context) {
     return GetBuilder<OnBoardController>(builder: (onBoardController){
       return Scaffold(
         body: Column(
           children: [
             Expanded(
               flex: 3,
               child: PageView.builder(
                 controller: onBoardController.pageController,
                 onPageChanged: (value){
                   onBoardController.onPageChanged(value);
                 },
                 itemCount: onBoardList.length,
                 itemBuilder: (BuildContext context, int index) {
                   return Column(
                     children: [
                       const SizedBox(height: 50,),
                       Image.asset(
                         onBoardList[index].image!,
                         width: 280,
                         height: 300,
                         fit: BoxFit.fill,
                       ),
                       const SizedBox(height: 50,),
                       Text(onBoardList[index].title!,style: TextStyle(color: ColorC.grey2,fontSize: 35),),
                       const SizedBox(height: 30,),
                       Text(onBoardList[index].body!,style: TextStyle(color: ColorC.grey,fontSize: 20),),
                     ],
                   );
                 },
               ),
             ),
             Expanded(
                 child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         ...List.generate(onBoardList.length, (index){
                           return AnimatedContainer(
                             duration: const Duration(milliseconds: 900),
                             width: index == onBoardController.currentPage ? 13 : 8,
                             height: index == onBoardController.currentPage ? 13 : 8,
                             margin: const EdgeInsets.symmetric(horizontal: 5),
                             decoration: BoxDecoration(
                                 color:index == onBoardController.currentPage ?   context.theme.canvasColor :ColorC.grey,
                                 borderRadius: BorderRadius.circular(10)
                             ),

                           );
                         })
                       ],
                     ),
                     const SizedBox(height: 15,),
                     Container(
                       width: 250,
                       height: 50,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       child: MaterialButton(
                         color: context.theme.canvasColor,
                         child: onBoardController.currentPage <= 1 ? Icon(Icons.arrow_forward,color: ColorC.white,):Text("Start Now".tr,style: TextStyle(color: ColorC.white),) ,
                         onPressed: (){
                           if(onBoardController.currentPage < 2 ){
                             onBoardController.next();
                           } else{
                             myServices.sharePref!.setString("onBoard", "succeed");
                             Get.offNamed("/login");
                           }
                         }, ),
                     ),

                     CustomTextButton(
                       text: "skip",
                       fontSize: 18,
                       color: ColorC.grey,
                       padding: const EdgeInsets.symmetric(vertical: 30),
                       onPressed: (){
                         myServices.sharePref!.setString("onBoard", "succeed");
                         Get.offNamed("/login");
                       },)
                   ],
                 ))
           ],
         ),
       );
     });
   }
 }
