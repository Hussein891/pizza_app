import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/auth/success_signup_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/view/widget/auth/custom_button_auth.dart';

// class SuccessSignUp extends StatelessWidget {
//   const SuccessSignUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
        
//         title:  Text('25'.tr,style: Theme.of(context).textTheme.bodyLarge!,),
//       ),
//       body: Column(
//         children: [
//           const Icon(Icons.check_circle_outline,size: 200,color: AppColor.premierColor,),
//           const Text("data"),
//           const Spacer(),
//           // ignore: sized_box_for_whitespace
//           Container(
//             width: double.infinity,
//             child: CustomButtonAuth(text: "17".tr,
//             onPressed: (){
//               Get.offNamed(AppRoute.login);
//             },),
//           ),
//           const SizedBox(height: 30,)
//         ],
//       ),
//     );
//   }
// }
class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title:  Text('25'.tr,style: Theme.of(context).textTheme.bodyLarge!,),
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
                  .labelLarge!
                  .copyWith(fontSize: 30)),
          Text("38".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}