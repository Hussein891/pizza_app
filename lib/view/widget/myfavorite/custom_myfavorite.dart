
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/myfavorite_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/functions/translatrdatabase.dart';
import 'package:pizzaapp/data/model/myfavoritemodel.dart';
import 'package:pizzaapp/linkapp.dart';

class CustomMyFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
 
  const CustomMyFavoriteItems({super.key, required this.itemsModel,});

  @override
  Widget build(BuildContext context) {
     
              return  InkWell(
                onTap: (){
                
                },
                child: Card(
                child: Padding(padding:  const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Hero(
                  tag: "${itemsModel.itemsId}",
                  child: CachedNetworkImage(imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage!}",
                  fit: BoxFit.fill,),
                ),
                 Expanded(
                  flex: 1,
                  child: Text("${translateDataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}")),
                  Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Text("47".tr,textAlign: TextAlign.center,),
                    Container(
                      height: 22,
                      alignment: Alignment.bottomCenter,
                      child: Row(children: [
                        ...List.generate(5, (index)=>const Icon(Icons.star,size: 15,))
                      ],),)
                  ],)),
                 Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: [
                  
                   Text("${itemsModel.itemsPrice} \$",style: const TextStyle(color: AppColor.premierColor),),
                  IconButton(onPressed: (){
                    controller.deletFromFav(itemsModel.favoriteId.toString());
                  },
                   icon:const Icon(Icons.delete_outline_rounded))
                ],)
                ],),),
                ),
              );
             
  }
}