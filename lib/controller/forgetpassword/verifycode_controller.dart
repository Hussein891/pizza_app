import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/data/datasurss/remote/forgetpassword/verifycod_forgetpass.dart';

abstract class VerifyCodeController extends GetxController{
  cheekCode();
  goToResetPassword(String verifiycode);
  goToSuccessSignUp();
}

class VerifyCodeControllerImp extends VerifyCodeController{
  String? email;
  VerifyCodeForgetPassData verifyCodeForgetPassData =VerifyCodeForgetPassData(Get.find());
  StatusRequest statusRequest = StatusRequest.none ;
  
  
   @override
  cheekCode() {
    
  }

  @override
  goToResetPassword(verifiycode) async{
    statusRequest = StatusRequest.loading;
    update();

    var response = await verifyCodeForgetPassData.postData(
       email!,verifiycode
    );

    print("Response: $response");//طباعة الاستجابة للتحقق منها
    // response == null => (بكون في مشكل يا بسرفر يا بلينك الصفحه)
    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success ) {
        Get.offNamed(AppRoute.resetPassword,arguments: {
          "email":email
        });
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Your VerifyCode ist Not Correct"
        );
        
      }
    }

    update();
  }
  
  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }
@override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }
}
// abstract class VerifyCodeController extends GetxController {
//   checkCode();
//   goToResetPassword(String verifycode);
// }

// class VerifyCodeControllerImp extends VerifyCodeController {
//   String? email;

//   VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
//       VerifyCodeForgetPasswordData(Get.find());

//   StatusRequest statusRequest = StatusRequest.none;

//   @override
//   checkCode() {}

//   @override
//   goToResetPassword(verifycode) async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response =
//         await verifyCodeForgetPasswordData.postData(email!, verifycode);
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         Get.offNamed(AppRoute.resetPassword , arguments: {
//           "email" : email
//         });
//       } else {
//         Get.defaultDialog(
//             title: "ُWarning", middleText: "Verify Code Not Correct");
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     email = Get.arguments['email'];
//     super.onInit();
//   }
// }