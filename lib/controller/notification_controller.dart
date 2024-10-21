
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/notification_data.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  
  getData() async {
    statusRequest = StatusRequest.loading;
    
    // جلب البيانات باستخدام NotificationData
    var response = await notificationData.getData(myServices.sharedPreferences.getString("id")!);
    
    // طباعة الاستجابة للتحقق منها
    print("Response: $response");
    
    // التحقق من استجابة null
    if (response == null) {
      statusRequest = StatusRequest.failure;
      print("Response is null");
    } else {
      // التعامل مع البيانات باستخدام handlingData
      statusRequest = handlingData(response);

     
      if (statusRequest == StatusRequest.success && response is Map && response.containsKey('data')) {
        data.clear();
        data.addAll(response['data']);
        print("Data fetched successfully: ${data.length} items.");
      } else {
        print("Unexpected response format: $response");
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }


  @override
  void onInit() {
    getData(); 
    super.onInit();
  }
}

