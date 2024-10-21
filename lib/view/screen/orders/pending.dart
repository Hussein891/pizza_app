import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/orders/pending_controller.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';
import 'package:pizzaapp/view/widget/order/card_order_list.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<PendingController>(
          builder: (controller) =>HandlingDataView(
            statusRequest: controller.statusRequest,
           widget: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: ((context,index)=>
           CardOrdersList(listdata:controller.data[index] ,))),)),
      ),
    );
  }
}

