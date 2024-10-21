import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/services/services.dart';

class MyMiddleWare extends GetMiddleware{
  @override
  int?get priority => 1;

  
MyServices myServices = Get.find();
  @override
  // ignore: body_might_complete_normally_nullable
  RouteSettings? redirect(String? route) {
   if(myServices.sharedPreferences.getString("step")=="2"){
    return const RouteSettings(name: AppRoute.home);
   }  

   if(myServices.sharedPreferences.getString("step")=="1"){
    return const RouteSettings(name: AppRoute.login);
   }  
  
  }
}