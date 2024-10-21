
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/address/view_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.premierColor,
        onPressed: () {
          Get.toNamed(AppRoute.addressAdd);
        },
        child: const Icon(Icons.add, color: AppColor.white),
      ),
      appBar: AppBar(
        //backgroundColor: AppColor.premierColor,
        title: const Text("Address"),
        //centerTitle: true,
        //iconTheme: const IconThemeData(color: AppColor.white),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text("${controller.data[i].addressName}"),
                  subtitle: Text("${controller.data[i].addressCity}, ${controller.data[i].addressStreet}"),
                  trailing: IconButton(onPressed: () {
                    controller.deleteAddress(controller.data[i].addressId.toString());
                  },icon: const Icon(Icons.delete_outline),),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
