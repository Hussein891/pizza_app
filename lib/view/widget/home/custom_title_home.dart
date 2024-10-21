import 'package:flutter/widgets.dart';
import 'package:pizzaapp/core/constant/color.dart';

class CustomTitelHome extends StatelessWidget {
  final String title;
  const CustomTitelHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      child:  Text(title,
   style: const TextStyle(
   color: AppColor.premierColor,fontSize: 20,fontWeight:FontWeight.bold),),
    );
  }
}