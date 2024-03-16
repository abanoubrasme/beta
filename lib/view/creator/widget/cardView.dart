import 'package:beta/control/creator/quizzesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/myServices.dart';

class CardView extends StatelessWidget {

  MyServices myServices = Get.put(MyServices());
  QuizzesController quizzesController = Get.put(QuizzesController());

   CardView({super.key,
     required this.keys,
     required this.index,
     required this.title,
     required this.confirmDismiss,
     required this.label,
     required this.background,
     required this.secondaryBackground,
   });
   Key keys;
   Widget label;
   Widget title;
   Widget index;
   Widget background;
   Widget secondaryBackground;
   final Future<bool?> Function(DismissDirection) confirmDismiss;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
        builder: (quizzesController){
          return  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Dismissible(
                movementDuration: const Duration(milliseconds: 1000),
                resizeDuration: const Duration(milliseconds: 1000),
                background: background,
                secondaryBackground: secondaryBackground,
                key: keys,
                confirmDismiss:confirmDismiss,
                child: Row(
                  children: [
                     index,
                     title,
                     label,
                  ],)
            ),
          );
        });
  }
}
