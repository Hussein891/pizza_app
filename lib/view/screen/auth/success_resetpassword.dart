
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/forgetpassword/success_resetpass_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/view/widget/auth/custom_button_auth.dart';

// class SuccessResetPassword extends StatelessWidget {
//   const SuccessResetPassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColor.white,
//         title: Text('25'.tr, style: Theme.of(context).textTheme.bodyLarge!),
//       ),
//       body: Column(
//         children: [
//           const Icon(Icons.check_circle_outline, size: 200, color: AppColor.premierColor),
//           const Text("Your password has been reset successfully."),
//           const Spacer(),
//           Container(
//             width: double.infinity,
//             child: CustomButtonAuth(
//               text: "Go to Login".tr,
//               onPressed: () {
//                 Get.offAllNamed(AppRoute.login);
//               },
//             ),
//           ),
//           const SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
// }
class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        title: Text('25'.tr, style: Theme.of(context).textTheme.bodyLarge!),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColor.premierColor,
          )),
          Text("37".tr,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 30)),
          Text("36".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
        ]),
      ),
    );
  }
}
