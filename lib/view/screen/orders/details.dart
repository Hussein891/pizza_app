// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzaapp/controller/orders/details_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller =Get.put(OrderDetailsController()); 
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderDetails'),
      ),
      body: Container(
        child: GetBuilder<OrderDetailsController>(builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest,
           widget: ListView(children:  [
          Table(children:  [
            TableRow(children:[
              Text("Product",textAlign: TextAlign.center,style: TextStyle(color: AppColor.premierColor,fontWeight: FontWeight.bold),),
              Text("QTY",textAlign: TextAlign.center,style: TextStyle(color: AppColor.premierColor,fontWeight: FontWeight.bold)),
              Text("Price",textAlign: TextAlign.center,style: TextStyle(color: AppColor.premierColor,fontWeight: FontWeight.bold)),
            ] 
            ),
            //   TableRow(children:[
            //   Text("Meat Pizza",textAlign: TextAlign.center,),
            //   Text("2",textAlign: TextAlign.center,),
            //   Text("100",textAlign: TextAlign.center,),
            // ] 
            // ),
              ...List.generate(
                controller.data.length,
                (index)=>TableRow(children:[
              Text("${controller.data[index].itemsName}",textAlign: TextAlign.center,),
              Text("${controller.data[index].countitems}",textAlign: TextAlign.center,),
              Text("${controller.data[index].itemsPrice}",textAlign: TextAlign.center,),
            ] 
            ))
          ],),
           Text("Total price :${controller.ordersModel!.ordersTotalprice!}",
           textAlign: TextAlign.center,
           style: TextStyle(color: AppColor.premierColor,fontWeight: FontWeight.bold),
          ),
          if(controller.ordersModel!.ordersType ==0)
          Card(child: Container(
            child:  ListTile(
              title: const Text("Shipping Address"),
              subtitle: Text("${controller.ordersModel!.addressCity}${controller.ordersModel!.addressStreet}"),
            ),
          ),),
          if(controller.ordersModel!.ordersType ==0)
          Container(
            padding: const EdgeInsets.symmetric(vertical:20),
            height: 300,
            width: double.infinity,
            child:GoogleMap(
                      mapType: MapType.normal,
                      markers: controller.markers.toSet(),
                      onTap: (latlong) { 
                      },
                      initialCameraPosition: controller.cameraPosition!,
                      onMapCreated: (GoogleMapController controllermap) {
                        controller.completercontroller?.complete(controllermap);
                      },
                    ), 
          )
        ],),))
      ),
    );
  }
}