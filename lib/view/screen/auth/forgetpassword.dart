import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/functions/validinput.dart';
import 'package:pizzaapp/view/widget/auth/custom_button_auth.dart';
import 'package:pizzaapp/view/widget/auth/custom_textfield_auth.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        title:  Text('26'.tr,style: Theme.of(context).textTheme.bodyLarge!,),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) =>
        HandlingDataRequest(
        statusRequest: controller.statusRequest,
         widget:  Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(color: Colors.white),
        child: Form(
          key:controller.formState ,
          child: ListView(children: [
             Text("23".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge,),
              Text("27".tr,textAlign: TextAlign.center,),
             const SizedBox(height: 40,),
            
           CustomTextFieldAuth(
            isNumber: false,
            valid: (val){
              return validInput(val!, 5, 50, "email");
            },
            myController: controller.email,
            labelText: "10".tr, 
            hintText: "11".tr,
            iconData: Icons.email_outlined, text: '',),
            
            const SizedBox(height: 60,),
            CustomButtonAuth(text: "23".tr,onPressed: (){
              controller.cheekEmail();
            },),
             
          ],),
        ),
      ),
        ),
      )
    );
  }
}
