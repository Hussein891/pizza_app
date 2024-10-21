import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/services/services.dart';

abstract class SettingsController extends GetxController{
  logOut();
}
class SettingsControllerImp extends SettingsController{
  MyServices myServices = Get.find();
  @override
  logOut() {
     String userid = myServices.sharedPreferences.getString("id")!;
            FirebaseMessaging.instance.unsubscribeFromTopic("users");
            FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
   myServices.sharedPreferences.clear();
   Get.offAllNamed(AppRoute.login);
  }
  
}