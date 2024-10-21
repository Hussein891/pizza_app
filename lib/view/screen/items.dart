import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/favoriet_controller.dart';
import 'package:pizzaapp/controller/items_controller.dart';
import 'package:pizzaapp/data/model/itemsmodel.dart';
import 'package:pizzaapp/view/screen/home.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';
import 'package:pizzaapp/view/widget/home/customappbar.dart';
import 'package:pizzaapp/view/widget/items/List_categories_items.dart';
import 'package:pizzaapp/view/widget/items/custom_list_items.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
     FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
       CustomAppBar(
            myController: controller.search!,
            hintText: "40".tr,
            onChanged:(val){
              controller.checkSearch(val);
            } ,
           onPressedSearch: (){
            controller.onSearchItems();
           },
           onPressedIcon: (){},
           ),
           const SizedBox(height: 10),
           const ListCategoriesItems(),
           GetBuilder<ItemsControllerImp>(builder: (controller)=>
        HandlingDataView(statusRequest: controller.statusRequest,
         widget:
          !controller.isSearch ?  GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.data.length,
            gridDelegate: 
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.6),
             itemBuilder: (BuildContext context,index){
               controllerFav.isFavorite[controller.data[index]['items_id']]= controller.data[index]['favorite'];
               return CustomListItems(
                itemsModel:ItemsModel.fromJson(controller.data[index]) );
             }) : ListItemsSearch(listDataModel: controller.listData)))
        ],), ),);
      
    

  }
}
