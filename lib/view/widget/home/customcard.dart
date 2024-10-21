import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/home_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/constant/onboardingimage.dart';

class CustomCard extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCard({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child:
                     Stack(children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          color: AppColor.premierColor,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:  ListTile(
                          title: Text(title,style: const TextStyle(color: AppColor.white,fontSize: 20)),
                          subtitle: Text(body,style: const TextStyle(color: AppColor.white,fontSize: 30)),
                        ),
                      ),
                      Positioned(
                        top: -30,
                        right:controller.lang =="en"? -30:null,
                        left: controller.lang =="ar"? -30:null,
                        child: Container(
                        height: 220,width: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(160)),
                          child: Image.asset(AppImageAsset.pizza1),
                          ),
                          ),
                     ],
                     ),
                     );
  }
}