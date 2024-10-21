import 'package:flutter/material.dart';
import 'package:pizzaapp/core/constant/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColor.premierColor,
        textColor: AppColor.white,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
// class CustomButtonAuth extends StatelessWidget {
//   final String text;
//   final void Function()? onPressed;
//   const CustomButtonAuth({Key? key, required this.text, this.onPressed})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin:const EdgeInsets.only(top: 10),
//       child: MaterialButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         padding:const EdgeInsets.symmetric(vertical: 13),
//         onPressed: onPressed,
//         color: AppColor.premierColor,
//         textColor: Colors.white,
//         child: Text(text , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 16)),
//       ),
//     );
//   }
// }
