// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/auth/signup_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/functions/alert_exit_app.dart';
import 'package:pizzaapp/core/functions/validinput.dart';
import 'package:pizzaapp/view/widget/auth/custom_button_auth.dart';
import 'package:pizzaapp/view/widget/auth/custom_text_signup_or_signin.dart';
import 'package:pizzaapp/view/widget/auth/custom_textfield_auth.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        title:  Text('17'.tr,style: Theme.of(context).textTheme.bodyLarge!,),
      ),
      body: WillPopScope(onWillPop:alertExitApp,
      child: GetBuilder<SignupControllerImp>(
        builder:(controller)=>
        HandlingDataRequest(
          statusRequest: controller.statusRequest,
         widget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(color: Colors.white),
        child: Form(
          key:controller.formState ,
          child: ListView(children: [
             Text("8".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge,),
             const SizedBox(height: 40,),
            CustomTextFieldAuth(
              isNumber: false,
              valid: (val){
                return validInput(val!, 4, 80, "username");
              },
            myController: controller.username,
            labelText: "18".tr, 
            hintText: "19".tr,
            iconData: Icons.person_outline, text: '',),
          const SizedBox(height: 40,),
           CustomTextFieldAuth(
            isNumber: false,
            valid: (val){
                return validInput(val!, 4, 80, "email");
              },
            myController: controller.email,
            labelText: "10".tr, 
            hintText: "11".tr,
            iconData: Icons.email_outlined, text: '',),
            const SizedBox(height: 40,),
           CustomTextFieldAuth(
            isNumber: true,
            valid: (val){
                return validInput(val!, 4, 80, "phon");
              },
            myController: controller.phon,
            labelText: "20".tr, 
            hintText: "21".tr,
            iconData: Icons.phone_android_outlined, text: '',),
          const SizedBox(height: 40,),
             CustomTextFieldAuth(
              isNumber: false,
             valid: (val){
                return validInput(val!, 4, 80, "password");
              },
            myController: controller.password,
            labelText: "12".tr, 
            hintText: "13".tr,
            iconData: Icons.lock_outline, text: '',),
            const SizedBox(height: 60,),
            CustomButtonAuth(text: "17".tr,onPressed: (){
              controller.signUp();
            },),
             CustomTextSignInOrSignUp(
              textOne:"22".tr,
              textTwe: "15".tr,
              onTap: (){
              controller.goToSignIn();
             },),
          ],),
        ),
      ),)
        ))
      );
    
  }
}
// class SignUp extends StatelessWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Get.put(SignUpControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColor.white,
//         title:  Text('17'.tr,style: Theme.of(context).textTheme.bodyLarge!,),
//       ),
//       body: WillPopScope(
//           onWillPop: alertExitApp,
//           child: GetBuilder<SignUpControllerImp>(
//             builder: (controller) =>
//                  HandlingDataRequest(statusRequest: controller.statusRequest,widget:  Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 30),
//                         child: Form(
//                           key: controller.formstate,
//                           child: ListView(children: [
//                             const SizedBox(height: 20),
//                             CustomTextTitleAuth(text: "10".tr),
//                             const SizedBox(height: 10),
//                             CustomTextBodyAuth(text: "24".tr),
//                             const SizedBox(height: 15),
//                             CustomTextFormAuth(
//                               isNumber: false,
//                               valid: (val) {
//                                 return validInput(val!, 3, 20, "username");
//                               },
//                               mycontroller: controller.username,
//                               hinttext: "23".tr,
//                               iconData: Icons.person_outline,
//                               labeltext: "20".tr,
//                               // mycontroller: ,
//                             ),
//                             CustomTextFormAuth(
//                               isNumber: false,

//                               valid: (val) {
//                                 return validInput(val!, 3, 40, "email");
//                               },
//                               mycontroller: controller.email,
//                               hinttext: "12".tr,
//                               iconData: Icons.email_outlined,
//                               labeltext: "18".tr,
//                               // mycontroller: ,
//                             ),
//                             CustomTextFormAuth(
//                               isNumber: true,
//                               valid: (val) {
//                                 return validInput(val!, 7, 11, "phone");
//                               },
//                               mycontroller: controller.phone,
//                               hinttext: "22".tr,
//                               iconData: Icons.phone_android_outlined,
//                               labeltext: "21".tr,
//                               // mycontroller: ,
//                             ),
//                             CustomTextFormAuth(
//                               isNumber: false,

//                               valid: (val) {
//                                 return validInput(val!, 3, 30, "password");
//                               },
//                               mycontroller: controller.password,
//                               hinttext: "13".tr,
//                               iconData: Icons.lock_outline,
//                               labeltext: "19".tr,
//                               // mycontroller: ,
//                             ),
//                             CustomButtonAuth(
//                                 text: "17".tr,
//                                 onPressed: () {
//                                   controller.signUp();
//                                 }),
//                             const SizedBox(height: 40),
//                             CustomTextSignUpOrSignIn(
//                               textone: "25".tr,
//                               texttwo: "26".tr,
//                               onTap: () {
//                                 controller.goToSignIn();
//                               },
//                             ),
//                           ]),
//                         ),
//                       )),
//           )),
//     );
//   }
// }
