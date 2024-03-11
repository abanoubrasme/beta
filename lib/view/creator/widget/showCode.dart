import 'package:flutter/material.dart';
import '../../../core/decoration/color.dart';
import '../../../core/decoration/font.dart';

class ShowCode extends StatelessWidget {

  const ShowCode({super.key, required this.code});

  final String code;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child:PopupMenuButton(
            iconSize: 30,
            icon: const Icon(Icons.code),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            elevation: 10,
            color: ColorC.teal,
            itemBuilder: (BuildContext context)=><PopupMenuEntry>[
              PopupMenuItem(
                child: Text(code,textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorC.white,fontSize: 25,
                      fontFamily:Font.f1),),
              ),
            ]
        ),),
    );
  }
}
