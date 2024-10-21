import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/onboardingcontroller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/data/datasurss/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(decoration: const BoxDecoration(color: AppColor.white),
      child: PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) => controller.changedPage(value),
          itemCount: onboardingList.length,
          itemBuilder:(context,i)=> Container(
            decoration: const BoxDecoration(color: AppColor.white),
            child: Column(
              children: [
                Image.asset(onboardingList[i].image!,
                height: Get.width/1.1,
                fit: BoxFit.fill,),
                const SizedBox(height: 50,),
                Text(onboardingList[i].body!,
                textAlign: TextAlign.center,
                style: const TextStyle(height: 2,color: AppColor.grey),
                ),
              ],),
          ),
            )),
    );
  }
}
