import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/home_controller.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/data/model/itemsmodel.dart';
import 'package:pizzaapp/linkapp.dart';
//import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';
import 'package:pizzaapp/view/widget/home/custom_title_home.dart';
import 'package:pizzaapp/view/widget/home/customappbar.dart';
import 'package:pizzaapp/view/widget/home/customcard.dart';
import 'package:pizzaapp/view/widget/home/list_categories_hom.dart';
import 'package:pizzaapp/view/widget/home/list_items_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return 
      
       GetBuilder<HomeControllerImp>(builder: (controller) => 
          Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(children:  [
           CustomAppBar(
            myController: controller.search!,
            hintText: "40".tr,
            onChanged:(val){
              controller.checkSearch(val);
            } ,
           onPressedSearch: (){
            controller.onSearchItems();
           },
           onPressedIcon: (){
             Get.toNamed(AppRoute.notification);
           },
           ),
       
        HandlingDataView(
  statusRequest: controller.statusRequest,
  widget: controller.isSearch 
      ? ListItemsSearch(listDataModel: controller.listData)
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(controller.sittingsData.isNotEmpty)
            CustomCard(title: "${controller.titleHomeCard}",
             body: "${controller.bodyHomeCard}"),
            CustomTitelHome(title: "43".tr),
            const ListCategoriesHom(),
            CustomTitelHome(title: "44".tr),
            // const ListItemsHome(),
            // CustomTitelHome(title: "44".tr),
            const ListItemsHome(),
          ],
        ),
)
          ],
          ),
      ),);
    
  }
}
class ListItemsSearch extends GetView<HomeControllerImp> {
  const ListItemsSearch({super.key, required this.listDataModel});
final List<ItemsModel> listDataModel;
  
  @override
Widget build(BuildContext context) {
  print("ListItemsSearch length: ${listDataModel.length}");
  return ListView.builder(
    itemCount: listDataModel.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder:(context, index) {
      return InkWell(
        onTap: (){controller.goToPageProductDetails(listDataModel[index]);},
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(child: CachedNetworkImage(
                    imageUrl: "${AppLink.imagesItems}/${listDataModel[index].itemsImage}")),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(listDataModel[index].itemsName ?? "No Name"),
                      subtitle: Text(listDataModel[index].categoriesName ?? "No Description"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

  }
