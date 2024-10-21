
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/orders/pending_controller.dart';

requestPermissionNotification()async{
NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

}

fcmConfig(){
FirebaseMessaging.onMessage.listen((message){
print("=========notification==========");
print(message.notification!.title);
print(message.notification!.body);
FlutterRingtonePlayer().playNotification();
Get.snackbar(message.notification!.title!,message.notification!.body! );
refreshPageNotification(message.data);
});

}

refreshPageNotification(data){
  print("==========pageid==========");
  print(data['pageid']);
  print("==============pagename=========");
  print(data['pagename']);
   print(Get.currentRoute);
if(Get.currentRoute =="/orderspending"&&data['pagename']=="refreshOrderPending"){
  PendingController controller = Get.find();
  controller.refreshOrder();
}
}