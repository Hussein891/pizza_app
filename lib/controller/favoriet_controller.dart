import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/favorite_data.dart';

class FavoriteController extends GetxController{
  Map isFavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());
  List data = [];
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
//kay => id
//value => 1 or 0 => active or no
  setFavorite(id,val){
    isFavorite[id]=val;
    update();
  }

  addFavorite(String itemsid)async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
      myServices.sharedPreferences.getString("id")!,itemsid
    );
    print("Response: $response"); // طباعة الاستجابة للتحقق منها
// response == null => (بكون في مشكل يا بسرفر يا بلينك الصفحه)
    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        Get.rawSnackbar(title: "dan",messageText: const Text("add"));
        //data.addAll(response['data']);
      } else {
        print("Unexpected response format: $response");
      }
    }

    
  }
  
  removeFavorite(String itemsid)async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
       myServices.sharedPreferences.getString("id")!,itemsid
    );
    print("Response: $response"); // طباعة الاستجابة للتحقق منها
// response == null => (بكون في مشكل يا بسرفر يا بلينك الصفحه)
    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
         Get.rawSnackbar(title: "dan",messageText: const Text("remove"));
        //data.addAll(response['data']);
      } else {
        print("Unexpected response format: $response");
      }
    }

    
  }
}