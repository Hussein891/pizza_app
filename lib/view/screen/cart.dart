import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/cart_controller.dart';
import 'package:pizzaapp/view/widget/cart/custom_bottom_navgaitonbar_cart.dart';
import 'package:pizzaapp/view/widget/cart/custom_itemscart_list.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title:const Text("My Cart") ,
      ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
              controllerCoupon: controller.controllerCoupon!,
              onApplyCoupon: (){
                controller.checkCoupon();
              },
                price: "${cartController.priceorders}",
                discount: "${controller.diescountCopupn}%",
                totalprice: "${controller.getTotalPrice()}")),
        body: GetBuilder<CartController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    
                    const SizedBox(height: 10),
                    // TopCardCart(
                    //     message:
                    //         "You Have ${cartController.totalcountitems} Items in Your List"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                            (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await cartController
                                      .add(cartController.data[index].itemsId!.toString());
                                  cartController.refreshPage();
                                },
                                onRemove: () async  {
                                 await cartController.delete(
                                      cartController.data[index].itemsId!.toString());
                                  cartController.refreshPage();
                                },
                                imagename:
                                    "${cartController.data[index].itemsImage}",
                                name: "${cartController.data[index].itemsName}",
                                price:
                                    "${cartController.data[index].itemsprice} \$",
                                count:
                                    "${cartController.data[index].countitems}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}

