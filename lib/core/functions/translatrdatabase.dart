import 'package:get/get.dart';
import 'package:pizzaapp/core/services/services.dart';

translateDataBase(columnAr,columnEn){
MyServices myServices = Get.find();

if(myServices.sharedPreferences.getString("lang")=="ar"){
   return columnAr;
}else{
  return columnEn;
}
}