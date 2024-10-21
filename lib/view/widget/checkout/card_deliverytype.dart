import 'package:flutter/material.dart';
import 'package:pizzaapp/core/constant/color.dart';

class CardDeliveryTypeCheckOut extends StatelessWidget {
  final String imagename;
  final String title;
  final bool isActive;
  const CardDeliveryTypeCheckOut({super.key, required this.imagename, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),
              color:isActive==true? AppColor.premierColor:Colors.grey[400]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Image.asset(
                    imagename,
                    
                    width: 70,),
                    Text(title,
                    style: TextStyle(
                      color:isActive==true? AppColor.white:AppColor.blake,
                      fontWeight: FontWeight.bold),)
              ],),
            );
  }
}