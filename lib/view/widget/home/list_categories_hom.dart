import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/home_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/functions/translatrdatabase.dart';
import 'package:pizzaapp/data/model/categoriesmodel.dart';
import 'package:pizzaapp/linkapp.dart';

class ListCategoriesHom extends GetView<HomeControllerImp> {
  const ListCategoriesHom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                      height: 130,
                      child:ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        separatorBuilder: (context,index)=>const SizedBox(width: 20,),
                        itemBuilder: (context,index){
                          return Categories(
                            i:index,
                            categoriesModel: CategoriesModel.fromJson(controller.categories[index]));
                        },
                         ),
                         );
  }
}

class Categories extends GetView<HomeControllerImp> {
 final CategoriesModel categoriesModel;
 final int? i;
  const Categories({super.key, required this.categoriesModel,required this.i,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       controller.goToItems(controller.categories, i!,categoriesModel.categoriesId!.toString());
      },
      child: Column(children: [
                              Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              height: 100,
                              width: 100,
                              child: CachedNetworkImage(imageUrl: "${AppLink.imagesCategories}/${categoriesModel.categoriesImage}"),
                            ),
                            Text("${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                            style: const TextStyle(color: AppColor.blake,fontSize: 12),)
                            ],
                            ),
    );
  }
}