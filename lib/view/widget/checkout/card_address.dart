import 'package:flutter/material.dart';
import 'package:pizzaapp/core/constant/color.dart';

class CardAddressCheckOut extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  const CardAddressCheckOut({super.key, required this.title, required this.body, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
            color:isActive==true? AppColor.premierColor:Colors.grey[400],
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
            title:Text(title,style: TextStyle(color:isActive==true? AppColor.white:AppColor.blake,fontWeight: FontWeight.bold),),
            subtitle:Text(body,style: TextStyle(color:isActive==true? AppColor.white:AppColor.blake),) ,
          ),);
  }
}