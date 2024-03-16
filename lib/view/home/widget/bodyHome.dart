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
        Container(height: 60,
         // color: context.theme.hoverColor,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration:  BoxDecoration(
                color: context.theme.canvasColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 8,
                      blurRadius: 7,
                      offset:  const Offset(5, 1)
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
