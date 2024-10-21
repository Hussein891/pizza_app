import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/data/datasurss/remote/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController{
  cheekEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formState =GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;
 
 

  @override
  cheekEmail()async {
  if (formState.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkEmailData.postData(email.text);
    print("============controller $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        Get.offNamed(AppRoute.verifyCode,arguments: {
          "email":email.text
        });
      }else{
         Get.defaultDialog(
          title: "Warning",
          middleText: "Your Email Not Correct"
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  }

  @override
  void onInit() {
    email=TextEditingController();
    
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
// abstract class ForgetPasswordController extends GetxController {
//   checkemail(); 
// }

// class ForgetPasswordControllerImp extends ForgetPasswordController {
  
//   CheckEmailData checkEmailData  = CheckEmailData(Get.find()) ; 

//   GlobalKey<FormState> formstate = GlobalKey<FormState>();
  
//   StatusRequest statusRequest  = StatusRequest.none ;  

//   late TextEditingController email;

//   @override
//   checkemail() async  {
//     if (formstate.currentState!.validate()){
//        statusRequest = StatusRequest.loading; 
//       update() ; 
//       var response = await checkEmailData.postData(email.text);
//       print("=============================== Controller $response ");
//       statusRequest = handlingData(response);
//       if (StatusRequest.success == statusRequest) {
//         if (response['status'] == "success") {
//           // data.addAll(response['data']);
//           Get.offNamed(AppRoute.verfiyCode , arguments: {
//             "email" : email.text
//           });
//         } else {
//           Get.defaultDialog(title: "ُWarning" , middleText: "Email Not Found"); 
//           statusRequest = StatusRequest.failure;
//         }
//       }
//       update();
//     }
//   }

 
//   @override
//   void onInit() {
//     email = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     email.dispose();
//     super.dispose();
//   }
// }
