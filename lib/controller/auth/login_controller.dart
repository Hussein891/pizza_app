// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/auth/login.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController{
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formState =GlobalKey<FormState>();
  StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;

  showPassword(){
    isShowPassword = isShowPassword ==true ?false:true;
    update();
  }
@override

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
         if(response['data']['users_approve']==1){
          myServices.sharedPreferences.setString("id", response['data']['users_id'].toString());
          myServices.sharedPreferences.setString("username", response['data']['users_name']);
          myServices.sharedPreferences.setString("email", response['data']['users_email']);
          myServices.sharedPreferences.setString("phon", response['data']['users_phon']);
          myServices.sharedPreferences.setString("step","2");
           String userid = myServices.sharedPreferences.getString("id")!;
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");
          Get.offNamed(AppRoute.home);
         }else{
          Get.toNamed(AppRoute.verifyCodeSignUp,arguments: {
            "email":email.text
          });
         }
          
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.singUp);
  }
  
   @override
  goToForgetPassword() {
   Get.toNamed(AppRoute.forgetPassword);
  }


  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value){
      print(value);
      String? token = value;
    });
    email=TextEditingController();
    password =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
 
}
