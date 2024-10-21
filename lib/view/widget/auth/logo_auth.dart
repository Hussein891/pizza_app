import 'package:flutter/material.dart';
import 'package:pizzaapp/core/constant/onboardingimage.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding:const EdgeInsets.all(5),
        child:   Image.asset(AppImageAsset.logo),
        );
  }
}
// class LogoAuth extends StatelessWidget {
//   const LogoAuth({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//         radius: 70,
//         backgroundColor: Colors.red,
//         child: Padding(
//           padding: const EdgeInsets.all(0), // Border radius
//           child: ClipOval(
//             child: Image.asset(
//               AppImageAsset.logo,
//             ),
//           ),
//         ));
//   }
// }