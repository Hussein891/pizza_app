import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/onboardingcontroller.dart';
import 'package:pizzaapp/view/widget/onboarding/custombutton.dart';
import 'package:pizzaapp/view/widget/onboarding/customslider.dart';
import 'package:pizzaapp/view/widget/onboarding/dotcontroller.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return  const Scaffold(
     
      body: SafeArea(child:
      Column(children: [
         Expanded(
        flex: 3,
         child:CustomSliderOnBoarding(),
       ),
       Expanded(
        flex: 1,
        child: Column(children: [
          CustomDotControllerOnBoarding(),
          Spacer(flex: 2,),
          CustombuttonOnBoarding(),
        ],))
      ],)
        
        ),
    );
  }
}