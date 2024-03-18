import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/decoration/color.dart';
import '../../../core/decoration/font.dart';
import '../../../services/myServices.dart';

class ShowCode extends StatelessWidget {

   ShowCode({super.key, required this.code});
   MyServices myServices = Get.find();

  final String code;

  @override
  Widget build(BuildContext context) {
    String lang = myServices.sharePref!.get("lang").toString();
    return Expanded(
      child: Align(
        alignment:lang == "en" ? Alignment.centerRight :Alignment.centerLeft,
        child:PopupMenuButton(
            iconSize: 30,
            icon: const Icon(Icons.code),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            elevation: 10,
            color: context.theme.canvasColor,
            itemBuilder: (BuildContext context)=><PopupMenuEntry>[
              PopupMenuItem(
                child: Text(code,textAlign: TextAlign.center,
                    style:context.textTheme.labelMedium
                ),
              ),
            ]
        ),),
    );
  }
}
