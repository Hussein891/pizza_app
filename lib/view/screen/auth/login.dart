import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/auth/login_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/functions/alert_exit_app.dart';
import 'package:pizzaapp/core/functions/validinput.dart';
import 'package:pizzaapp/view/widget/auth/custom_button_auth.dart';
import 'package:pizzaapp/view/widget/auth/custom_text_signup_or_signin.dart';
import 'package:pizzaapp/view/widget/auth/custom_textfield_auth.dart';
import 'package:pizzaapp/view/widget/auth/logo_auth.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        title:  Text('15'.tr,style: Theme.of(context).textTheme.bodyLarge!,),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop:alertExitApp, 
      child: GetBuilder<LoginControllerImp>(
        builder: (controller) => 
        HandlingDataRequest(
        statusRequest: controller.statusRequest, 
        widget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(color: Colors.white),
        child: Form(
          key: controller.formState,
          child: ListView(children: [
             
             const Logo(),
          Text("8".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge),
          Text("9".tr,textAlign: TextAlign.center,),
          const SizedBox(height: 15,),
            CustomTextFieldAuth(
              isNumber: false,
              valid: (val){
                return validInput(val!, 5, 60, "email");
              },
              myController: controller.email,
            labelText: "10".tr, 
            hintText: "11".tr,
            iconData: Icons.email_outlined, text: '',),
          const SizedBox(height: 25,),
           GetBuilder<LoginControllerImp>(
            builder: (controller)=>CustomTextFieldAuth(
            isNumber: false,
            obscureText: controller.isShowPassword,
            onTapIcon: (){
              controller.showPassword();
            },
            valid: (val){
                return validInput(val!, 4, 60, "password");
              },
            myController: controller.password,
            labelText: "12".tr, 
            hintText: "13".tr,
            iconData: Icons.password_outlined, text: 'sss',),),
            const SizedBox(height: 7,),
             InkWell(
              onTap: (){
                controller.goToForgetPassword();},
              child: Text("14".tr,textAlign: TextAlign.end,)),
            const SizedBox(height: 20,),
            CustomButtonAuth(text: "15".tr,
                   onPressed: (){
                    controller.login();
                   },
                   ),
             CustomTextSignInOrSignUp(
              textOne:"16".tr,
              textTwe: "17".tr,
              onTap: (){
               controller.goToSignUp();
              },),
          ],),
        ),
      ),),)
      )
    );
  }
}
