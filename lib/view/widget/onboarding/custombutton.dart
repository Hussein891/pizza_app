import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/onboardingcontroller.dart';
import 'package:pizzaapp/core/constant/color.dart';

class CustombuttonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustombuttonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 0),
        textColor: Colors.white,
        onPressed:(){
          controller.next();
        } ,
        color: AppColor.premierColor,
        child:  Text("7".tr),
        ),
    );
  }
}