import 'package:get/get.dart';

validInput(String value ,int min,int max,String type){
  if(value.isEmpty){
    return "37".tr;
  }
   if(type == "username"){
    if(!GetUtils.isUsername(value)){
      return "34".tr;
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(value)){
      return "35".tr;
    }
  }
  if(type == "phon"){
    if(!GetUtils.isPhoneNumber(value)){
      return "36".tr;
    }
  }
  
  if(value.length<min){
    return "can`t be less than $min";
  }
  if(value.length>max){
    return "can`t be larger than $max";
  }
}