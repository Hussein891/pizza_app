
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/home_screen_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/view/widget/custom_appbar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
         backgroundColor: AppColor.premierColor,
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: const Icon(Icons.shopping_cart,color: AppColor.white,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomAppbarHome(),
        // ignore: deprecated_member_use
        body: WillPopScope(
          child:controller.listPage.elementAt(controller.currentPage),
          onWillPop: () {
            Get.defaultDialog(
              title: "Warning",
              middleText: "Do You Want To Exit The App",
              onCancel: (){},
              onConfirm: (){
                exit(0);
              }
            );
            return Future.value(false);
          },
          
          )
      ),
    );
  }
}
