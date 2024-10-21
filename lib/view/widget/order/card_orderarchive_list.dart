import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pizzaapp/controller/orders/archive_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/data/model/orders_model.dart';
import 'package:pizzaapp/view/widget/order/dialog_rating.dart';

class CardOrdersListArchive extends GetView<ArchiveController> {
  final OrdersModel listdata;
  const CardOrdersListArchive({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(child: Container(
              padding: const EdgeInsets.all(10),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                   children: [
                     Text("Order Number : #${listdata.ordersId}"),
                     const Spacer(),
                     
                     Text(Jiffy.parse(listdata.ordersDetetime!).fromNow())
                   ],
                 ),
                 const Divider(),
                 Text("Order Type : ${controller.printOrderType(listdata.ordersType.toString())}"),
                 Text("Order Price :${listdata.ordersPrice}\$"),
                 Text("Delivery Price :${listdata.ordersPricedeilivery}\$"),
                 Text("Payment Method:${controller.printPaymentMethod(listdata.ordersPaymentmethod.toString())}"),
                 Text("Order Status:${controller.printOrderStatus(listdata.ordersStatus.toString())}"),
                const Divider(),
                 Row(
                   children: [
                    const Text("Total Price : 50\$"),
                    const Spacer(),
                     MaterialButton(onPressed: (){
                      Get.toNamed(AppRoute.ordersDetails,arguments: {
                        "ordersmodel":listdata
                      });
                     }, 
                     color: AppColor.premierColor,
                     textColor: AppColor.white,
                     shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                     child: const  Text("Details"),
                     ),
                     const SizedBox(width: 10,),
                     if(listdata.ordersRating ==0)
                     MaterialButton(onPressed: (){
                      showDialogRating(context,listdata.ordersId!.toString());
                     }, 
                     color: AppColor.premierColor,
                     textColor: AppColor.white,
                     shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                     child: const  Text("Rating"),
                     ),
                     const SizedBox(width: 10,),
                   ],
                 )
              ],
              ),
            ),
            );
  }
}
