import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/constant/app_theem.dart';
import 'package:pizzaapp/core/functions/fcmconfig.dart';
import 'package:pizzaapp/core/services/services.dart';

class LocaleController extends GetxController{
  Locale? language;
  ThemeData appTheem =themeEnglish;
  MyServices myServices = Get.find();

  changeLang(String language){
    Locale locale = Locale(language);
    myServices.sharedPreferences.setString("lang", language);
    appTheem = language  == "ar" ? themeArabic : themeEnglish;
    Get.updateLocale(locale);
  }

  requestPerLocation()async{
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Get.snackbar("title", "الرجاء تشغيل الوكيشن");
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Get.snackbar("title", "الرجاء اعطاء الصلاحيه للتطبيق ");
    }
  }
   if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("title", "لايمكن تشغيل التطبيق من دون الوكيشن");
  } 
  }
  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();
    requestPerLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang == "ar"){
      language = const Locale("ar");
      appTheem =themeArabic;
    }else if(sharedPrefLang == "en"){
      language = const Locale("en");
      appTheem =themeEnglish;
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
      appTheem =themeEnglish;
    }
    super.onInit();
  }
}