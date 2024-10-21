import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/orders/archive_controller.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';
import 'package:pizzaapp/view/widget/order/card_orderarchive_list.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Container(
        
        padding: const EdgeInsets.all(10),
        child: GetBuilder<ArchiveController>(
          builder: (controller) =>HandlingDataView(
            statusRequest: controller.statusRequest,
           widget: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: ((context,index)=>
           CardOrdersListArchive(listdata:controller.data[index] ,))),)),
      ),
    );
  }
}

 