import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/address/add_part2_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/view/widget/auth/custom_button_auth.dart';
import 'package:pizzaapp/view/widget/auth/custom_textfield_auth.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';

class AddressAddPartTwo extends StatelessWidget {
  const AddressAddPartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    AddressAddPartTwoController controller = Get.put(AddressAddPartTwoController());
    return Scaffold(
      
       appBar: AppBar(
        backgroundColor: AppColor.premierColor,
        title: const Text("Add Details Address",style: TextStyle(color:AppColor.white ),),
        centerTitle: true,
        iconTheme:const IconThemeData(color: AppColor.white) ,
        
       ),
       body:  Container(
  padding: const EdgeInsets.all(15),
  child: GetBuilder<AddressAddPartTwoController>(builder: (controller) =>
   HandlingDataView(
    statusRequest: controller.statusRequest,
   widget: ListView(children: [
    CustomTextFieldAuth(
      labelText: "Name",
       hintText: "Name",
        iconData: Icons.location_on,
         myController: controller.name, 
         valid: (val){
           return null;
         },
          isNumber: false,
           text: ""),
            CustomTextFieldAuth(
      labelText: "City",
       hintText: "City",
        iconData: Icons.location_city,
         myController: controller.city, 
         valid: (val){
           return null;
         },
          isNumber: false,
           text: ""), CustomTextFieldAuth(
      labelText: "Street",
       hintText: "Street",
        iconData: Icons.location_on_rounded,
         myController: controller.street, 
         valid: (val){
           return null;
         },
          isNumber: false,
           text: ""),
           CustomButtonAuth(text: "Add",onPressed: () {
             controller.addAddress();
           },)
  ],),),)
)
    );
  }
}