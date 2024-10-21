import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/data/datasurss/remote/auth/verifiycode_signup.dart';


abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifiyCodeSignupData verfiyCodeSignUpData = VerifiyCodeSignupData(Get.find());
 

  String? email;

  StatusRequest statusRequest = StatusRequest.none ;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postData(email!, verfiyCodeSignUp); 
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") { 
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "ُWarning",
            middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend(){
    verfiyCodeSignUpData.resendData(email!); 
  }
}