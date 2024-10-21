// ignore_for_file: overridden_fields

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/home_controller.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/items_data.dart';
import 'package:pizzaapp/data/model/itemsmodel.dart';
import 'dart:core';
import '../core/class/statusrequest.dart';

abstract class ItemsController extends GetxController{
initialData();
changeCat(int val,String catVal);
getItems(String categoryId);
goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;
  String? catId;
  String deliveryTime = "";
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    search =TextEditingController();
    initialData();
    super.onInit();
  }

  initialData() {
    deliveryTime = myServices.sharedPreferences.getString("deliverytime")!;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catId = Get.arguments['catId'];
    getItems(catId!);
  }

  changeCat(val,catVal) {
    selectedCat = val;
    catId = catVal;
    getItems(catId!);
    update();
  }

  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryId,myServices.sharedPreferences.getString("id")!);
    print("Response: $response");

    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success ) {
        if (response['data'] != null && response['data'].isNotEmpty) {
          data.addAll(response['data']);
        } else {
          print("Data is empty: ${response['data']}");
          statusRequest = StatusRequest.failure;
        }
      } else {
        print("Unexpected response format: $response");
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
  
  goToPageProductDetails(itemsModel) {
   Get.toNamed(AppRoute.productDetails,arguments: {
    "itemsmodel":itemsModel ,
   });
  }
}
// import 'package:get/get.dart';
// import 'package:pizzaapp/core/class/statusrequest.dart';
// import 'package:pizzaapp/core/functions/handlingdata.dart';
// import 'package:pizzaapp/core/services/services.dart';
// import 'package:pizzaapp/data/datasurss/remote/items_data.dart';
// import 'package:pizzaapp/data/model/itemsmodel.dart';

// abstract class ItemsController extends GetxController {
//   intialData();
//   changeCat(int val, String catval);
//   getItems(String categoryid);
//   goToPageProductDetails(ItemsModel itemsModel);
// }

// class ItemsControllerImp extends GetxController {
//   List categories = [];
//   String? catid;
//   int? selectedCat;

//   ItemsData testData = ItemsData(Get.find());

//   List data = [];

//   late StatusRequest statusRequest;

//   MyServices myServices = Get.find();

//   @override
//   void onInit() {
//      //search = TextEditingController();
//     intialData();
//     super.onInit();
//   }

//   intialData() {
//     categories = Get.arguments['categories'];
//     selectedCat = Get.arguments['selectedcat'];
//     catid = Get.arguments['catid'];
//     getItems(catid!);
//   }

//   changeCat(val, catval) {
//     selectedCat = val;
//     catid = catval;
//     getItems(catid!);
//     update();
//   }

//   getItems(categoryid) async {
//     data.clear();
//     statusRequest = StatusRequest.loading;
//     var response = await testData.getData(
//         categoryid, myServices.sharedPreferences.getString("id")!);
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       // Start backend
//       if (response['status'] == "success") {
//         data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//       // End
//     }
//     update();
//   }

  
//   goToPageProductDetails(itemsModel) {
//     Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
//   }
// }

