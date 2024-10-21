import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/data/datasurss/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{
  ResetPasswordData resetPasswordData =ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  GlobalKey<FormState> formState =GlobalKey<FormState>(); 
  late TextEditingController password;
  late TextEditingController rePassword;
 
  @override
  goToSuccessResetPassword()async{
    if(password.text != rePassword.text){
     return Get.defaultDialog(
          title: "Warning",
          middleText: "Your Password is not Match"
        );
    }
    if (formState.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    var response = await resetPasswordData.postData(
       email!,
        password.text
    );

    print("Response: $response");//طباعة الاستجابة للتحقق منها
    
      statusRequest = handlingData(response);

      if (StatusRequest.success==statusRequest) {
        if(response['status']=="success"){
        Get.offNamed(AppRoute.successResetPassword);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "try Again"
        );
      
      }
      }
  }
  }
 
  @override
  resetPassword() {
    
  }
  @override
  void onInit() {
    email = Get.arguments['email'];
    password=TextEditingController();
    rePassword=TextEditingController();
    
    super.onInit();
  }
  @override
void dispose() {
  password.dispose();
  rePassword.dispose();
  super.dispose();
}

}
// abstract class ResetPasswordController extends GetxController {
//   resetpassword();
//   goToSuccessResetPassword();
// }

// class ResetPasswordControllerImp extends ResetPasswordController {
//   GlobalKey<FormState> formstate = GlobalKey<FormState>();

//   ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

//   StatusRequest statusRequest = StatusRequest.none ;

//   late TextEditingController password;
//   late TextEditingController repassword;

//   String? email;

//   @override
//   resetpassword() {}

//   @override
//   goToSuccessResetPassword() async {
//     if (password.text != repassword.text) {
//       return Get.defaultDialog(
//           title: "warning", middleText: "Password Not Match");
//     }

//     if (formstate.currentState!.validate()) {
//       statusRequest = StatusRequest.loading;
//       update();
//       var response = await resetPasswordData.postData(email!, password.text);
//       print("=============================== Controller $response ");
//       statusRequest = handlingData(response);
//       if (StatusRequest.success == statusRequest) {
//         if (response['status'] == "success") {
//           // data.addAll(response['data']);
//           Get.offNamed(AppRoute.successResetpassword);
//         } else {
//           Get.defaultDialog(
//               title: "ُWarning", middleText: "Try Again");
//           statusRequest = StatusRequest.failure;
//         }
//       }
//       update();
//     } else {
//       print("Not Valid");
//     }
//   }

//   @override
//   void onInit() {
//     email = Get.arguments['email'];
//     password = TextEditingController();
//     repassword = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     password.dispose();
//     repassword.dispose();
//     super.dispose();
//   }
// }