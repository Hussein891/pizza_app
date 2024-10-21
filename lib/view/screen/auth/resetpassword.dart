import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/forgetpassword/resetpassword_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/functions/validinput.dart';
import 'package:pizzaapp/view/widget/auth/custom_button_auth.dart';
import 'package:pizzaapp/view/widget/auth/custom_textfield_auth.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        title:  Text('30'.tr,style: Theme.of(context).textTheme.bodyLarge!,),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) =>HandlingDataRequest(
          statusRequest: controller.statusRequest,
         widget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(color: Colors.white),
        child: Form(
          key:controller.formState ,
          child: ListView(children: [
             Text("8".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge,),
              Text("31".tr,textAlign: TextAlign.center,),
             const SizedBox(height: 40,),
            
           CustomTextFieldAuth(
            isNumber: false,
            valid: (val){
              return validInput(val!, 5, 20, "password");
            },
            myController: controller.password,
            labelText: "12".tr, 
            hintText: "13".tr,
            iconData: Icons.lock_outline, text: 'ccc',),
            const SizedBox(height: 25,),
            CustomTextFieldAuth(
              isNumber: false,
              valid: (val){
                return validInput(val!, 5, 20, "password");
              },
            myController: controller.rePassword,
            labelText: "12".tr, 
            hintText: "32".tr,
            iconData: Icons.lock_outline, text: '',),
            
            const SizedBox(height: 60,),
            CustomButtonAuth(text: "33".tr,onPressed: (){
              controller.goToSuccessResetPassword();
            },),
             
          ],),
        ),
      )) ,)
    );
  }
}
// class ResetPassword extends StatelessWidget {
//   const ResetPassword({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Get.put(ResetPasswordControllerImp());
//     return Scaffold(
//       appBar:  AppBar(
//         centerTitle: true,
//         backgroundColor: AppColor.white,
//         title:  Text('30'.tr,style: Theme.of(context).textTheme.bodyLarge!,),
//       ),
//       body: GetBuilder<ResetPasswordControllerImp>(
//           builder: (controller) => HandlingDataRequest(
//               statusRequest: controller.statusRequest,
//               widget: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                 child: Form(
//                   key: controller.formState,
//                   child: ListView(children: [
//                     const SizedBox(height: 20),
//                     CustomTextTitleAuth(text: "35".tr),
//                     const SizedBox(height: 10),
//                     CustomTextBodyAuth(text: "35".tr),
//                     const SizedBox(height: 15),
//                     CustomTextFormAuth(
//                       isNumber: false,
//                       valid: (val) {
//                         return validInput(val!, 3, 40, "password");
//                       },
//                       mycontroller: controller.password,
//                       hinttext: "13".tr,
//                       iconData: Icons.lock_outline,
//                       labeltext: "19".tr,
//                       // mycontroller: ,
//                     ),
//                     CustomTextFormAuth(
//                       isNumber: false,

//                       valid: (val) {
//                         return validInput(val!, 3, 40, "password");
//                       },
//                       mycontroller: controller.repassword,
//                       hinttext: "Re" + " " + "13".tr,
//                       iconData: Icons.lock_outline,
//                       labeltext: "19".tr,
//                       // mycontroller: ,
//                     ),
//                     CustomButtonAuth(
//                         text: "33".tr,
//                         onPressed: () {
//                           controller.goToSuccessResetPassword();
//                         }),
//                     const SizedBox(height: 40),
//                   ]),
//                 ),
//               ))),
//     );
//   }
// }

