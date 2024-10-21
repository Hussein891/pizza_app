import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/data/datasurss/remote/auth/signup_data.dart';

abstract class SignupController extends GetxController{
  signUp();
  goToSignIn();
}

class SignupControllerImp extends SignupController{
  GlobalKey<FormState> formState =GlobalKey<FormState>(); 
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phon;
  late TextEditingController password;

  StatusRequest statusRequest=StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  List data =[];
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
  @override
   signUp() async {
  var formData = formState.currentState;
  if (formData!.validate()) {
    statusRequest = StatusRequest.loading;
    update();

    var response = await signupData.postData(
      username.text, email.text, password.text, phon.text
    );

    print("Response: $response");//طباعة الاستجابة للتحقق منها
    // response == null => (بكون في مشكل يا بسرفر يا بلينك الصفحه)
    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if(response['status']=="success"){
        Get.offNamed(AppRoute.verifyCodeSignUp, arguments: {
          "email":email.text
        });
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Your Email is Already in Use"
        );
        
      }
    }
    }

    update();
  } else {
    print("Not valid");
  }
}
 

  @override
  void onInit() {
    username=TextEditingController();
    email=TextEditingController();
    phon=TextEditingController();
    password =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phon.dispose();
    password.dispose();
    super.dispose();
  }
}
// abstract class SignUpController extends GetxController {
//   signUp();
//   goToSignIn();
// }

// class SignUpControllerImp extends SignUpController {
//   GlobalKey<FormState> formstate = GlobalKey<FormState>();

//   late TextEditingController username;
//   late TextEditingController email;
//   late TextEditingController phone;
//   late TextEditingController password;

//    StatusRequest statusRequest = StatusRequest.none;

//   SignupData signupData = SignupData(Get.find());

//   List data = [];

//   @override
//   signUp() async {
//     if (formstate.currentState!.validate()) {
//       statusRequest = StatusRequest.loading; 
//       update() ; 
//       var response = await signupData.postData(
//           username.text, password.text, email.text, phone.text);
//       print("=============================== Controller $response ");
//       statusRequest = handlingData(response);
//       if (StatusRequest.success == statusRequest) {
//         if (response['status'] == "success") {
//           // data.addAll(response['data']);
//           Get.offNamed(AppRoute.verfiyCodeSignUp  ,arguments: {
//             "email" : email.text
//           });
//         } else {
//           Get.defaultDialog(title: "ُWarning" , middleText: "Phone Number Or Email Already Exists") ; 
//           statusRequest = StatusRequest.failure;
//         }
//       }
//       update();
//     } else {
      
//     }
//   }

//   @override
//   goToSignIn() {
//     Get.offNamed(AppRoute.login);
//   }

//   @override
//   void onInit() {
//     username = TextEditingController();
//     phone = TextEditingController();
//     email = TextEditingController();
//     password = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     username.dispose();
//     email.dispose();
//     phone.dispose();
//     password.dispose();
//     super.dispose();
//   }
// }