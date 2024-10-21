// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pizzaapp/controller/productdetails_controller.dart';
// import 'package:pizzaapp/core/constant/color.dart';
// import 'package:pizzaapp/linkapp.dart';

// class TopPageProductDetails extends GetView<ProductDetailsControllerImp> {
//   const TopPageProductDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return   Stack(
//           clipBehavior: Clip.none,
//           children: [
//           Container(
//             height: 200,
//             decoration: const BoxDecoration(
//             color: AppColor.premierColor,borderRadius: BorderRadius.vertical(bottom:Radius.circular(20),),),
//           ),
//           Positioned(
//             //top: 50.0,
//             left: Get.width/8,
//             right: Get.width/8,
//             child: Hero(
//               tag: "${controller.itemsModel.itemsId}",
//               child: CachedNetworkImage
//               (imageUrl: "${AppLink.imagesItems}/${controller.itemsModel.itemsImage!}",height: 300,fit: BoxFit.fill,),),)
//         ],);
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/productdetails_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/linkapp.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(color: AppColor.premierColor),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${controller.itemsModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imagesItems}/${controller.itemsModel.itemsImage!}",
                height: 250,
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}