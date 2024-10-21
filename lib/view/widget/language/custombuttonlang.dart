import 'package:flutter/material.dart';
import 'package:pizzaapp/core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  const CustomButtonLang({super.key, required this.textbutton, this.onPressed});
  final String textbutton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.premierColor,
        textColor: AppColor.white,
        onPressed:onPressed,
        child: Text(textbutton),
        ),
    );
  }
}