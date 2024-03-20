import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowCode extends StatelessWidget {

   const ShowCode({super.key,
     required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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
    );
  }
}
