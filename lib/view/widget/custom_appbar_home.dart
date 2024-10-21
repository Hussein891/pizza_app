import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/home_screen_controller.dart';
import 'package:pizzaapp/view/widget/home/custom_botton_appbar.dart';

class CustomAppbarHome extends StatelessWidget {
  const CustomAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder: (controller)=>BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            children: [
              ...List.generate(
                controller.listPage.length + 1,
                (index) {
                  int i = index > 2 ? index - 1 : index;
                  if (index == 2) {
                    return const Spacer();
                  } else {
                    return CustomBottonAppBar(
                      onPressed: () {
                        controller.changPage(i);
                      },
                      text:controller.bottomAppBar[i]['title'].toString() ,
                      iconData: controller.bottomAppBar[i]['icon'],   
                      active: controller.currentPage == i ? true : false,
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}