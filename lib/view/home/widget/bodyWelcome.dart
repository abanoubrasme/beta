import 'package:flutter/material.dart';

class BodyWelcome extends StatelessWidget {

   BodyWelcome({super.key,
     required this.children});

  List<Widget> children = const <Widget>[];

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(height: 15,),
        Expanded(
            child:Container(
              width: double.infinity,
              decoration:  BoxDecoration(
                  color: Colors.white,
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
              child:  ListView(
                children:children,
              ),
            )
        ),
      ],
    );
  }
}
