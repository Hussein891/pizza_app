// import 'package:get/get.dart';
// import 'package:pizzaapp/core/class/statusrequest.dart';
// import 'package:pizzaapp/core/functions/handlingdata.dart';
// import 'package:pizzaapp/data/datasurss/remote/test_data.dart';

// class TestController extends GetxController{
//   TestData testData =TestData(Get.find());
//   List data = [];
//   late StatusRequest statusRequest;

//   getData()async{
//   statusRequest = StatusRequest.loading;
//   var response = await testData.getData();
//   statusRequest = handlingData(response);
//   if(StatusRequest.success==statusRequest){
// if (response['status']=="success"){
//  data.addAll(response['data']);
// }else{
// statusRequest = StatusRequest.failure;

// }
     
//   }
//   update();
//   }

// ignore_for_file: avoid_print

//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }
// }
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/data/datasurss/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("Response: $response"); // طباعة الاستجابة للتحقق منها
// response == null => (بكون في مشكل يا بسرفر يا بلينك الصفحه)
    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success && response is Map && response.containsKey('data')) {
        data.addAll(response['data']);
      } else {
        print("Unexpected response format: $response");
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
