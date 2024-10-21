import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/cart_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/view/widget/cart/custom_button_cart.dart';
import 'package:pizzaapp/view/widget/cart/custom_button_coupon.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price ; 
  final String discount ; 
  final String totalprice ; 
  final TextEditingController controllerCoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart({Key? key, required this.price, required this.discount, required this.totalprice, required this.controllerCoupon, this.onApplyCoupon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
       GetBuilder<CartController>(builder: (controller)=> 
       controller.couponName ==null?
       Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: controllerCoupon,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal:17,vertical: -4),
                  hintText: "Coupon Code",
                  
                  border: OutlineInputBorder()
                ),
              )),
              const SizedBox(width: 5,),
            Expanded(
              flex: 1,
              child: CustomButtonCoupon(
                textbutton: "Apply",
                onPressed: onApplyCoupon,)),
          ],
        ),):Container(child: Text("Coupon Code : ${controller.couponName}",style: const TextStyle(color: AppColor.premierColor,fontWeight: FontWeight.bold),),)),
        
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.premierColor),
            borderRadius: BorderRadius.circular(20)),
          child:Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("price", style: TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$price \$", style: const TextStyle(fontSize: 16)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("discount", style: TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$discount ", style: const TextStyle(fontSize: 16)))
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("Total Price",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.premierColor))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalprice \$",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.premierColor)))
          ],
        ),
        ],) ,),
        const SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "Order Now",
          onPressed: () {
            controller.goToCheckOut();
          },
        )
      ],
    ));
  }
}
