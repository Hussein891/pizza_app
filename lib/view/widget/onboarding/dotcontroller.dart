import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/onboardingcontroller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/data/datasurss/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>
    (builder: (controller)=>Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(onboardingList.length,
         (index)=>AnimatedContainer(
          margin: const EdgeInsets.only(right: 5),
          duration: const Duration(milliseconds: 900),
          height: 5,
          width: controller.currentPage == index ? 20 : 5,
          decoration: BoxDecoration(
            color: AppColor.premierColor,
            borderRadius: BorderRadius.circular(10)),
          ),
          )
      ],
    ),
    );
  }
}