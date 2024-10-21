import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/onboardingimage.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading?
     Center(child: Lottie.asset(ImageLottie.loading,width: 250,height: 250)):
    statusRequest == StatusRequest.offlineFailure?
     Center(child:Lottie.asset(ImageLottie.offline,width: 250,height: 250)):
    statusRequest == StatusRequest.serverFailure?
     Center(child: Lottie.asset(ImageLottie.serverFailure,width: 250,height: 250)):
    statusRequest == StatusRequest.failure?
     Center(child:Lottie.asset(ImageLottie.noData,width: 250,height: 250)):widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading?
     Center(child: Lottie.asset(ImageLottie.loading,width: 250,height: 250)):
    statusRequest == StatusRequest.offlineFailure?
     Center(child:Lottie.asset(ImageLottie.offline,width: 250,height: 250)):
    statusRequest == StatusRequest.serverFailure?
     Center(child: Lottie.asset(ImageLottie.serverFailure,width: 250,height: 250)):
    widget;
  }
}