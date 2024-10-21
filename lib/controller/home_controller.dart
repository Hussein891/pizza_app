

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/home_data.dart';
import 'package:pizzaapp/data/model/itemsmodel.dart';

abstract class HomeController extends SearchMixController{
initialData();
getData();
goToItems(List categories, int selectedCat,String categoryId);
goToPageProductDetails(itemsModel);
}
class HomeControllerImp extends HomeController{
MyServices myServices = Get.find();
String? username;
String? id;
String? lang;
String? titleHomeCard = "";
String? bodyHomeCard  = "";
String? deliveryTime  = "";

  // ignore: overridden_fields
  HomeData homeData = HomeData(Get.find());
  List categories= [];
  List items= [];
  List sittingsData = [];
 
 

@override
  initialData(){
    lang     = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id       = myServices.sharedPreferences.getString("id");
}
@override
  void onInit() {
    search =TextEditingController();
  
    initialData();
    getData();
    super.onInit();
  }
  
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("Response: $response"); // طباعة الاستجابة للتحقق منها
// response == null => (بكون في مشكل يا بسرفر يا بلينك الصفحه)
    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if ( StatusRequest.success == statusRequest) {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        sittingsData.addAll(response['sittings']['data']);
        titleHomeCard = sittingsData[0]['sittings_titlehome'];
        bodyHomeCard = sittingsData[0]['sittings_bodyhome'];
        deliveryTime = sittingsData[0]['sittings_deliverytime'].toString();
        myServices.sharedPreferences.setString("deliverytime", deliveryTime!);
      } else {
        print("Unexpected response format: $response");
      }
    }

    update();
  }

  @override
  goToItems(categories, selectedCat, categoryId) {
    Get.toNamed(AppRoute.items,arguments: {
      "categories" : categories,
      "selectedcat" : selectedCat,
      "catId": categoryId
    });
  }
  


  @override
  goToPageProductDetails(itemsModel) {
   Get.toNamed(AppRoute.productDetails,arguments: {
    "itemsmodel":itemsModel ,
   });
  }
    
  }

  class SearchMixController extends GetxController{
    HomeData homeData = HomeData(Get.find());
     late StatusRequest statusRequest;
      List<ItemsModel> listData =[];
      TextEditingController? search;
      bool isSearch =false;
   checkSearch(String val) {
  if (val.isEmpty) {
    isSearch = false;
    listData.clear(); 
    statusRequest = StatusRequest.none;  
    update();    
  } else {
    isSearch = true;
    update();
  }
}
  
  onSearchItems() {
  if (search!.text.isNotEmpty) {
    searchData();
  } else {
    isSearch = false;
    listData.clear(); 
    update();
  }
}
searchData() async {
  statusRequest = StatusRequest.loading;
  update();      

  var response = await homeData.searchData(search!.text);
  print("Response: $response"); // طباعة الاستجابة للتحقق منها

  if (response == null) {
    statusRequest = StatusRequest.failure;
  } else {
    if (response['status'] == "success") {
      listData.clear();
      List responseData = response['data'];
      listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  update();       
}
  }