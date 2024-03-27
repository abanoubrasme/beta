import 'package:beta/view/home/widget/popupMenuButtonAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';


class BodyHome extends StatelessWidget {

   BodyHome({super.key,
  required this.children,
  });
  List<Widget> children = const <Widget>[];
   MyServices myServices = Get.find();



   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      SizedBox(
        height: 220,
        width: double.infinity,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.asset('image/on1.png',fit: BoxFit.fill),
            Column(
              children: [
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButtonAppBar(
                    text1: 'Setting'.tr,
                    text2: 'LogOut'.tr,
                    iconItem1: Icons.settings,
                    iconItem2: Icons.login,
                    onSelected:(e){
                      if(e==1){
                        Get.toNamed('/setting');
                      }
                      if(e==2){
                        var lang =  myServices.sharePref!.get("lang");
                        var theme =  myServices.sharePref!.get("theme");
                        myServices.sharePref!.clear();
                        myServices.sharePref!.setString("lang",lang.toString());
                        myServices.sharePref!.setString("theme",theme.toString());
                        myServices.sharePref!.setString("onBoard","succeed");
                        Get.offAllNamed('/login');
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        child: Container(
          width: double.infinity,
          decoration:  BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow:  [
                BoxShadow(
                  color: ColorC.black2,
                  spreadRadius: 3,
                  blurRadius: 18,
                  offset: const Offset(0,5),
                )
              ]
          ),
          child:  Align(
            alignment:Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:children,
              ),
            ),

          ),
        ),
      )
      ],
    );
  }
}
