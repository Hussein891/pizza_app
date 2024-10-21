import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/checkout_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/constant/onboardingimage.dart';
import 'package:pizzaapp/view/widget/cart/custom_button_cart.dart';
import 'package:pizzaapp/view/widget/checkout/card_address.dart';
import 'package:pizzaapp/view/widget/checkout/card_deliverytype.dart';
import 'package:pizzaapp/view/widget/checkout/card_paymentmethod.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckOut"),
      ),
      bottomNavigationBar:  CustomButtonCart(textbutton: "Check Out",onPressed: (){controller.checkOut();},),
      body: GetBuilder<CheckOutController>(builder: (controller) => HandlingDataView(
      statusRequest: controller.statusRequest, 
      widget:Container(
        margin: const EdgeInsets.all(10),
        child: ListView(children:  [
           const Text("Choose Payment Method",style: TextStyle(
            color: AppColor.premierColor,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
          InkWell(
            onTap: () {
              controller.choosePaymentMethod("0");
            },
            child:CardPaymentMethodCheckOut(
              title: "Cash",
              isActive:controller.paymentMethod == "0"? true:false)),
          InkWell(
            onTap: () {
              controller.choosePaymentMethod("1");
            },
            child:  CardPaymentMethodCheckOut(title: "By Cart", isActive:controller.paymentMethod =="1"?true: false)),
          const Text("Choose Delivery Type",style: TextStyle(
            color: AppColor.premierColor,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
            Row(children: [
             InkWell(
              onTap: () {
                controller.chooseDeliveryType("0");
              },
              child: CardDeliveryTypeCheckOut(
                imagename: AppImageAsset.delivery,
                 title: "Delivery", 
                 isActive:controller.deliveryType == "0"?true:false)),
             const SizedBox(width: 100,),
             InkWell(
              onTap: () {
                controller.chooseDeliveryType("1");
              },
              child: CardDeliveryTypeCheckOut(
                imagename: AppImageAsset.driveThru,
                 title: "Drive Thru",
                 isActive:controller.deliveryType == "1"?true:false)),
           
          ],),
           const SizedBox(height: 20),
           const Text("Seeping Address",style: TextStyle(
            color: AppColor.premierColor,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
          if(controller.deliveryType == "0")
          Column(
  children: [
    ...List.generate(
      controller.dataAddress.length,
      (index) => InkWell(
        onTap: () {
          controller.chooseAddress(controller.dataAddress[index].addressId!.toString());
        },
        child: CardAddressCheckOut(
          title: "${controller.dataAddress[index].addressName}",
          body: "City: ${controller.dataAddress[index].addressCity}\nStreet: ${controller.dataAddress[index].addressStreet}",
          isActive: controller.addressId == controller.dataAddress[index].addressId.toString(),

        ),
      ),
    ),
  ],
)

         
        
      ],),
      ), ),)
    );
  }
}