import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/myfavorite_controller.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';
//import 'package:pizzaapp/view/widget/home/customappbar.dart';
import 'package:pizzaapp/view/widget/myfavorite/custom_myfavorite.dart';

class MyFavoriet extends StatelessWidget {
  const MyFavoriet({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyFavorite'),
       
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) => ListView(
            children: [
              // CustomAppBar(
              //   onPressedSearch: () {},
              //   hintText: "40".tr,
              //   onPressedIcon: () {},
              //   onPressedIconFavorite: () {},
              // ),
              const SizedBox(height: 20,),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6
                  ),
                  itemBuilder: (context, index) {
                    return CustomMyFavoriteItems(itemsModel: controller.data[index]);
                  }
                )
              )
            ]
          )
        )
      ));
  }
}
