import 'package:flutter/material.dart';
import 'package:pizzaapp/core/constant/color.dart';

class CardPaymentMethodCheckOut extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckOut({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(color: isActive == true ?  AppColor.premierColor :Colors.grey[400],
            borderRadius: BorderRadius.circular(20)),
            child: Text(title,
            style: TextStyle(
              color:isActive==true? AppColor.white:AppColor.blake,fontSize: 18,fontWeight: FontWeight.bold),
          ),
      );
  }
}