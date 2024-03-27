import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_options.dart';

class MyServices extends GetxService{

 late SharedPreferences? sharePref;
 Future<MyServices> init()async{
   WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   sharePref = await SharedPreferences.getInstance();

   return this;
 }
}

initialServices()async{
  await Get.putAsync(() => MyServices().init());
}