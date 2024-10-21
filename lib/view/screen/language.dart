import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/constant/routes.dart';
//import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/localization/changelocal.dart';
import 'package:pizzaapp/view/widget/language/custombuttonlang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: const EdgeInsets.all(15),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("1".tr,style: Theme.of(context).textTheme.bodyLarge,),
             const SizedBox(height: 20,),
            CustomButtonLang(textbutton: "2".tr,onPressed: () {
              controller.changeLang("ar");
              Get.toNamed(AppRoute.onBoarding);
            },),
            CustomButtonLang(textbutton: "6".tr,onPressed: () {
              controller.changeLang("en");
              Get.toNamed(AppRoute.onBoarding);
            },),
          ],
        ),
      ),
    );
  }
}