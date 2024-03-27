import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardController extends GetxController{

  late PageController pageController ;
  int currentPage = 0 ;
  next(){
    currentPage++;
    pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    update();
  }
  onPageChanged(int index){
    currentPage = index;
    update();
  }

  @override
  void onInit() {
      pageController =PageController();
      super.onInit();
  }

}