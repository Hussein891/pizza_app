// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:pizzaapp/controller/cart_controller.dart';
// import 'package:pizzaapp/core/class/statusrequest.dart';
// import 'package:pizzaapp/core/constant/routes.dart';
// import 'package:pizzaapp/core/functions/handlingdata.dart';
// import 'package:pizzaapp/core/services/services.dart';
// import 'package:pizzaapp/data/datasurss/remote/cart_data.dart';
// import 'package:pizzaapp/data/model/itemsmodel.dart';


// abstract class ProductDetailsController extends GetxController {}

// class ProductDetailsControllerImp extends ProductDetailsController {
//    CartControllerImp cartController = Get.put(CartControllerImp());

//   late ItemsModel itemsModel;

//   CartData cartData = CartData(Get.find());

//   late StatusRequest statusRequest;

//   MyServices myServices = Get.find();

//   int countitems = 0;

//   intialData() async {
//     statusRequest = StatusRequest.loading;
//     itemsModel = Get.arguments['itemsmodel'];
//     countitems = await getCountItems(itemsModel.itemsId!);
//     statusRequest = StatusRequest.success;
//     update();
//   }


//   getCountItems(String itemsid) async {
//     statusRequest = StatusRequest.loading;
//     var response = await cartData.getCountCart(
//         myServices.sharedPreferences.getString("id")!, itemsid);
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       // Start backend
//       if (response['status'] == "success") {
//         int countitems = 0;
//         countitems = int.parse(response['data'].toString());
//         print("==================================");
//         print("$countitems");
//         return countitems;
//         // data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//       // End
//     }
//   }

//   addItems(String itemsid) async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await cartData.addCart(
//         myServices.sharedPreferences.getString("id")!, itemsid);
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       // Start backend
//       if (response['status'] == "success") {
//         Get.rawSnackbar(
//             title: "اشعار",
//             messageText: const Text("تم اضافة المنتج الى السلة "));
//         // data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//       // End
//     }
//     update();
//   }

//   deleteitems(String itemsid) async {
//     statusRequest = StatusRequest.loading;
//     update();

//     var response = await cartData.deletCart(
//         myServices.sharedPreferences.getString("id")!, itemsid);
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       // Start backend
//       if (response['status'] == "success") {
//         Get.rawSnackbar(
//             title: "اشعار",
//             messageText: const Text("تم ازالة المنتج من السلة "));
//         // data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//       // End
//     }
//     update();
//   }

//   List subitems = [
//     {"name": "Small", "id": 1, "active": '0'},
//     {"name": "Medium", "id": 2, "active": '0'},
//     {"name": "Larg", "id": 3, "active": '1'}
//   ];

//   add() {
//     addItems(itemsModel.itemsId!);
//     countitems++;
//     update();
//   }

//   remove() {
//     if (countitems > 0) {
//       deleteitems(itemsModel.itemsId!);
//       countitems--;
//       update();
//     }
//   }

//     goTOCart(){
//   Get.toNamed(AppRoute.cart);
//     }
//   @override
//   void onInit() {
//     intialData();
//     super.onInit();
//   }
// }
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/cart_data.dart';
import 'package:pizzaapp/data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());

  late ItemsModel itemsModel;

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  int countitems = 0;

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data'].toString());
        print("==================================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  addItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deletCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  List subitems = [
    {"name": "Smo", "id": 1, "active": '0'},
    {"name": "Mid", "id": 2, "active": '0'},
    {"name": "Lag", "id": 3, "active": '1'}
  ];

  add() {
    addItems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteitems(itemsModel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
