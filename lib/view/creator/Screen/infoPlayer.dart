
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/infoPlayerController.dart';
import '../../../core/constant/widget/customText.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';
import '../widget/hasData.dart';

class Info extends StatelessWidget {
   Info({super.key});

  InfoPlayerController infoPlayerController = Get.put(InfoPlayerController());
   MyServices myServices = Get.find();

   @override
  Widget build(BuildContext context) {
    String quizName = myServices.sharePref!.get("quizName").toString();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          title: CustomText(
            text:"Main Page".tr,
            style: context.textTheme.labelMedium,
            padding: const EdgeInsets.symmetric(horizontal: 0),),
          centerTitle: true,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new),
            color: ColorC.grey2,
            onPressed: () {
              Get.back();
            },),
          bottom:  PreferredSize(
              preferredSize: const Size.fromHeight(10.0),
              child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Text("Name".tr,style: TextStyle(color: ColorC.grey2,fontSize: 22),textAlign:TextAlign.center)),
                Expanded(
                    flex: 3,
                    child: Text("Quiz".tr,style: TextStyle(color: ColorC.grey2,fontSize: 22),textAlign:TextAlign.center)),
                Expanded(
                    flex: 2,
                    child: Text("Total".tr,style: TextStyle(color: ColorC.grey2,fontSize: 18),textAlign:TextAlign.center)),
                Expanded(
                    flex: 2,
                    child: Text("Degree".tr,style: TextStyle(color: ColorC.grey2,fontSize: 18),textAlign:TextAlign.center)),
              ],
            ) ,),

      ),
        body:FutureBuilder(
            future: infoPlayerController.getInfo(quizName),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if(!snapshot.hasData){
                return const HasData();
              }else{
                return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [

                        Table(
                            columnWidths: const {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(3),
                              2: FlexColumnWidth(2),
                              3: FlexColumnWidth(2),
                            },
                            border: TableBorder.all(color: ColorC.grey2,width: 0),
                            children:  [

                              TableRow(
                                    decoration: BoxDecoration(border: Border.all(width: 1,color: ColorC.grey2)),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Text(snapshot.data["data"][index]["user_name"],style: TextStyle(color: ColorC.grey2,fontSize: 16),textAlign:TextAlign.center),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Text(snapshot.data["data"][index]["quiz_name"],style: TextStyle(color: ColorC.grey2,fontSize: 16),textAlign:TextAlign.center),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Text(snapshot.data["data"][index]["final_degree"].toString(),style: TextStyle(color: ColorC.grey2,fontSize: 15),textAlign:TextAlign.center ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Text(snapshot.data["data"][index]["degree"].toString(),style: TextStyle(color: ColorC.grey2,fontSize: 15),textAlign:TextAlign.center ),
                                    ),
                                  ]),

                            ],
                          ),
                      ],
                    );
                  },
                );
              }

            })

    );
  }
}


// Container(
// padding: EdgeInsets.all(8),
// child: Table(
// //columnWidths: ,
// border: TableBorder.all(color: ColorC.grey2),
// children:  [
// TableRow(children: [
// Text('Cell 1',style: TextStyle(color: ColorC.grey2),),
// Text('Cell 2',style: TextStyle(color: ColorC.grey2),),
// Text('Cell 3',style: TextStyle(color: ColorC.grey2),),
// ]),
// TableRow(children: [
// Text('Cell 4',style: TextStyle(color: ColorC.grey2),),
// Text('Cell 5',style: TextStyle(color: ColorC.grey2),),
// Text('Cell 6',style: TextStyle(color: ColorC.grey2),),
// ])
// ],
// ),
// ),



// DataTable(
// dataTextStyle: TextStyle(color: ColorC.grey2),
// columns: const [
// DataColumn(
// label: Text('Name'),
// ),
// DataColumn(
// label: Text('Quiz'),
// ),
// DataColumn(
// label: Text('Total'),
// ),
// DataColumn(
// label: Text('Degree'),
// ),
// ],
// rows: [
// DataRow.byIndex(
// index: index,
// cells:  [
// DataCell(Text(snapshot.data["data"][index]["user_name"])),
// DataCell(Text(snapshot.data["data"][index]["quiz_name"])),
// DataCell(Text(snapshot.data["data"][index]["final_degree"].toString())),
// DataCell(Text(snapshot.data["data"][index]["degree"].toString())),
// ])
// ],
// )