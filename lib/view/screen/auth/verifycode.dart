import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/forgetpassword/verifycode_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/view/widget/auth/customextbodyauth.dart';
import 'package:pizzaapp/view/widget/auth/customexttitleauth.dart';


// class VerifyCode extends StatelessWidget {
//   const VerifyCode({super.key});

//   @override
//   Widget build(BuildContext context) {
//      Get.put(VerifyCodeControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColor.white,
//         title:  Text('28'.tr,style: Theme.of(context).textTheme.bodyLarge!,),
//       ),
//       body: GetBuilder<VerifyCodeControllerImp>(
//         builder: (controller) =>
//        HandlingDataRequest(
//         statusRequest: controller.statusRequest,
//          widget:
//          Container(
//         padding: const EdgeInsets.symmetric(horizontal: 30),
//         decoration: const BoxDecoration(color: Colors.white),
//         child: ListView(children: [
//           // Text("Welcome",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge,),
//             Text("29".tr,textAlign: TextAlign.center,),
//            const SizedBox(height: 40,),
//           OtpTextField(
//         numberOfFields: 5,
//         fieldWidth: 50,
//         borderRadius: BorderRadius.circular(20),
//         borderColor: const Color(0xFF512DA8),
//         showFieldAsBox: true, 
//         onCodeChanged: (String code) {             
//         },
//         onSubmit: (String verifiycode){
//           controller.goToResetPassword(verifiycode);
//         }
         
//           ),
//         ],),
//       ),),)
//     );
//   }
// }
class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller =
        Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        title:  Text('28'.tr,style: Theme.of(context).textTheme.bodyLarge!,),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Check code"),
          const SizedBox(height: 10),
           CustomTextBodyAuth(
              text:
                  "Please Enter The Digit Code Sent To ${controller.email}"),
          const SizedBox(height: 15),
            OtpTextField(
              
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor:const  Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                     controller.goToResetPassword(verificationCode) ; 
                }, // end onSubmit
              ), 
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
