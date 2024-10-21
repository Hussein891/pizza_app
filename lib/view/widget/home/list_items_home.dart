import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/home_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/data/model/itemsmodel.dart';
import 'package:pizzaapp/linkapp.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                          height: 140,
                         child:ListView.builder(
                            itemCount: controller.items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,i){
                              return Items(
                                itemsModel: ItemsModel.fromJson(controller.items[i]));
                            })
                         );
  }
}

class Items extends GetView<HomeControllerImp>{
 final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});
   
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                  child: CachedNetworkImage(imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage}",)
                                ),
                                Container(
                                  height: 210,
                                  width: 150,
                                  decoration:  BoxDecoration(
                                    color: AppColor.blake.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30)),
                           ),
                            Positioned(
                            left: 10,
                            top: 40,
                            child: Text("46".tr,style: const TextStyle(color: AppColor.white,fontSize: 30),
                            // اذا بدي طلع اسماء المنتج 
                            //Text("${{itemsModel.itemsName}",style: const TextStyle(color: AppColor.white,fontSize: 30),
                            ),
                           ),
                           ],),
    );
  }
}