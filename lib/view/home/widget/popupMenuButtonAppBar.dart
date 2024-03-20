import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/decoration/color.dart';
import '../../../core/decoration/font.dart';


class PopupMenuButtonAppBar extends StatelessWidget {

  PopupMenuButtonAppBar({super.key,
    required this.text1,
    required this.text2,
    required this.iconItem1,
    required this.iconItem2 ,
    required this.onSelected,
  });

  final String text1;
  final String text2;
  final IconData iconItem1;
  final IconData iconItem2;
  void Function(dynamic)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton(
              iconSize: 30,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              onSelected:onSelected,
              elevation: 10,
              color:ColorC.backgroundLight,
              itemBuilder: (BuildContext context)=><PopupMenuEntry>[
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(iconItem1,color: Colors.grey[700]),
                      const SizedBox(width: 10,),
                      Text(text1,style: TextStyle(color: ColorC.grey2,),),
                    ],
                  ),
                ),
                PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(iconItem2,color: Colors.grey[700]),
                        const SizedBox(width: 10,),
                        Text(text2,style: TextStyle(color: ColorC.grey2, ),),
                      ],
                    )
                ),
              ]
          ),
        );
  }

}