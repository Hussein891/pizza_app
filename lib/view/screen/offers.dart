import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/favoriet_controller.dart';
import 'package:pizzaapp/controller/offers_controller.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';
import 'package:pizzaapp/view/widget/offers/custom_list_items_offers.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
         FavoriteController controllerFav = Get.put(FavoriteController());

    return GetBuilder<OffersController>(builder: (controller)=>HandlingDataView(
      statusRequest: controller.statusRequest,
       widget: ListView.builder(
        itemCount:controller.data.length,
        itemBuilder: (context,index)=>CustomListItemsOffers(
          itemsModel: controller.data[index]))));
  }
}