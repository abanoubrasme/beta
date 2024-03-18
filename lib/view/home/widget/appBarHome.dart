
import 'package:flutter/material.dart';
import '../../../core/constant/betaText.dart';
import '../../../core/decoration/color.dart';
import '../../../core/decoration/font.dart';


// class AppBarHome2 extends AppBarHome {
//
//   // AppBarHome2({super.key,
//   //   required super.text1,
//   //   required super.text2,
//   //   required super.iconItem1,
//   //   required super.iconItem2,
//   //   required super.onSelected});
//
//
//   AppBarHome2({
//     required this.text1,
//     required this.text2,
//     required this.iconItem1,
//     required this.iconItem2 ,
//     required this.onSelected,
//   } ) ;
//
//   final String text1;
//   final String text2;
//   final IconData iconItem1;
//   final IconData iconItem2;
//   void Function(dynamic)? onSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       flexibleSpace: Container(
//         decoration:  BoxDecoration(
//             color: context.theme.primaryColor,
//             borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30),),
//             boxShadow:  const [
//               BoxShadow(
//                   spreadRadius: 5,
//                   blurRadius: 10,
//                   offset:  Offset(3, 1)
//               )
//             ]
//         ),
//         child: Center(
//           child: BeTaText(text: "BeTa",
//             fontSize: 70,
//             padding: const EdgeInsets.only(top: 50),),
//         ),
//       ),
//       centerTitle: true,
//       elevation: 0,
//       toolbarHeight: 150.0,
//       leading:const Text(""),
//       actions: [
//         Align(
//           alignment: Alignment.topRight,
//           child: PopupMenuButton(
//               iconSize: 30,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15.0)),
//               ),
//               onSelected:onSelected,
//               elevation: 10,
//               color: Colors.white,
//               itemBuilder: (BuildContext context)=><PopupMenuEntry>[
//                 PopupMenuItem(
//                   value: 1,
//                   child: Row(
//                     children: [
//                       Icon(iconItem1,color: Colors.grey[700]),
//                       const SizedBox(width: 10,),
//                       Text(text1,style: TextStyle(color: ColorC.grey2,
//                           fontFamily:Font.f1 ),),
//                     ],
//                   ),
//                 ),
//                 PopupMenuItem(
//                     value: 2,
//                     child: Row(
//                       children: [
//                         Icon(iconItem2,color: Colors.grey[700]),
//                         const SizedBox(width: 10,),
//                         Text(text2,style: TextStyle(color: ColorC.grey2, fontFamily: Font.f1),),
//                       ],
//                     )
//                 ),
//               ]
//           ),
//         )
//       ],
//     );
//       Column(
//       children: [
//         Align(
//           alignment: Alignment.topRight,
//           child: PopupMenuButton(
//               iconSize: 30,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15.0)),
//               ),
//               onSelected:onSelected,
//               elevation: 10,
//               color: Colors.white,
//               itemBuilder: (BuildContext context)=><PopupMenuEntry>[
//                 PopupMenuItem(
//                   value: 1,
//                   child: Row(
//                     children: [
//                       Icon(iconItem1,color: Colors.grey[700]),
//                       const SizedBox(width: 10,),
//                       Text(text1,style: TextStyle(color: ColorC.grey2,
//                           fontFamily:Font.f1 ),),
//                     ],
//                   ),
//                 ),
//                 PopupMenuItem(
//                     value: 2,
//                     child: Row(
//                       children: [
//                         Icon(iconItem2,color: Colors.grey[700]),
//                         const SizedBox(width: 10,),
//                         Text(text2,style: TextStyle(color: ColorC.grey2, fontFamily: Font.f1),),
//                       ],
//                     )
//                 ),
//               ]
//           ),
//         ),
//         BeTaText(text: "BeTa", color: ColorC.white, fontSize: 70,
//           padding: const EdgeInsets.only(bottom: 10),),
//       ],
//     );
//   }
//
// }

class AppBarHome {
  AppBarHome({
    required this.color,
    required this.text1,
    required this.text2,
    required this.iconItem1,
    required this.iconItem2 ,
    required this.onSelected,
  });
  final String text1;
  final String text2;
   Color color;
  final IconData iconItem1;
  final IconData iconItem2;
  void Function(dynamic)? onSelected;

  AppBar buildAppBar() {
    return AppBar(
     title:  BeTaText(text: "BeTa",
       fontSize: 70,
       padding: const EdgeInsets.only(top: 50),),
      backgroundColor: color,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 100,
      leading:const Text(""),
      actions: [
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton(
              iconSize: 30,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              onSelected:onSelected,
              elevation: 10,
              color: ColorC.backgroundLight,
              itemBuilder: (BuildContext context)=><PopupMenuEntry>[
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(iconItem1,color: Colors.grey[700]),
                      const SizedBox(width: 10,),
                      Text(text1,style: TextStyle(color: ColorC.grey2,
                          fontFamily:Font.f1 ),),
                    ],
                  ),
                ),
                PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(iconItem2,color: Colors.grey[700]),
                        const SizedBox(width: 10,),
                        Text(text2,style: TextStyle(color: ColorC.grey2, fontFamily: Font.f1),),
                      ],
                    )
                ),
              ]
          ),
        )
      ],
    );
  }





}