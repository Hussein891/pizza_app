import 'package:flutter/material.dart';
import 'package:pizzaapp/core/constant/color.dart';

class CustomTextSignInOrSignUp extends StatelessWidget {
  final String textOne;
  final String textTwe;
  final void Function() onTap;
  const CustomTextSignInOrSignUp({super.key, required this.textOne, required this.textTwe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
             Text(textOne),
            InkWell(
              onTap: onTap,
              child: Text(
                textTwe,style:const TextStyle(
                  color: AppColor.premierColor,fontWeight: FontWeight.bold),
                  ),
                  ),
          ],);
  }
}
