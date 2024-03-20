import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/decoration/color.dart';


class BodyHome extends StatelessWidget {

   BodyHome({super.key,
  required this.children,
  });
  List<Widget> children = const <Widget>[];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
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
        ),
      ],
    );
  }
}
