import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/address_data.dart';

class AddressAddPartTwoController extends GetxController{
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());

  List data = [];
  TextEditingController?name;
  TextEditingController?city;
  TextEditingController?street;
  
  String? lat;
  String? long;
 intialData(){
  name=TextEditingController();
  city=TextEditingController();
  street=TextEditingController();
  lat = Get.arguments['lat'];
  long = Get.arguments['long'];
  print(lat);
  print(long);
 }

addAddress() async {
  statusRequest = StatusRequest.loading;
  update();
  
  var response = await addressData.addData(
    myServices.sharedPreferences.getString("id")!,
    name!.text,
    city!.text,
    street!.text,
    lat!,
    long!
  );
  print("Full Response: $response");

  if (response == null) {
    statusRequest = StatusRequest.failure;
    
  } else {
    statusRequest = handlingData(response);
    
    if (statusRequest == StatusRequest.success) {
      print("Success: Address added successfully");
       Get.offAllNamed(AppRoute.home);
    } else {
      print("Failed: $response");
    }
  }
  
  update();
}

      @override
  void onInit() {
    intialData();
    super.onInit();
  }

}