import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/bindings/initialbindings.dart';
import 'package:pizzaapp/core/localization/changelocal.dart';
import 'package:pizzaapp/core/localization/translation.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/routes.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  
  print("Handling a background message: ${message.messageId}");
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
  LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Pizza App',
      locale: controller.language,
      theme: controller.appTheem,
      initialBinding:InitialBindings() ,
      getPages:routes,
    );
  }
}

