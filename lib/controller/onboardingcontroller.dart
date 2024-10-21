import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/static/static.dart';

abstract class OnBoardingController extends GetxController{
  next();

  changedPage(int index);
}

class OnBoardingControllerImp extends OnBoardingController{
  late PageController pageController;
   int currentPage = 0;
   MyServices myServices =Get.find();
  @override
  changedPage(int index) {
    currentPage = index;
    update();
  }

  @override
  next() {
    currentPage++;
    if(currentPage >onboardingList.length -1){
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    }else{
       pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
   
  
  }
  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }
}