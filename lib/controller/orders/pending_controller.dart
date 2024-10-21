import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/orders/pending.dart';
import 'package:pizzaapp/data/model/orders_model.dart';

class PendingController extends GetxController{
  MyServices myServices =Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel> data = [];
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
String printOrderType(String val){
  if(val=="0"){
    return "Deliver";
  }else{
    return "Drive Thru";
  }
}
String printPaymentMethod(String val){
  if(val=="0"){
    return "Cash";
  }else{
    return "Card";
  }
}
String printOrderStatus(String val){
  if(val=="0"){
    return "Pending Approval";
  }else if(val =="1"){
     return "The Order is Being Prepared";
  }else if(val == "2"){
return "Ready to Picked up By Delivery";
  }else if(val == "3"){
return "On The Way";
  }
  else{
return "Archive";
  }
}


  getOrder() async {
  data.clear();
  update();
  statusRequest = StatusRequest.loading;
  update();
  var response = await ordersPendingData.getData(
    myServices.sharedPreferences.getString("id")!);
  print("Raw Response: $response");

  
  if (response == null || response is! Map) {
     print("Unexpected response format. Response: $response");
    statusRequest = StatusRequest.failure;
    print("Error: Response is null or not a Map. Response: $response");
  } else {
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      }
    } else {
      print("Unexpected response format: $response");
      statusRequest = StatusRequest.failure;
    }
  }

  update();
}

deleteOrder(String orderid) async {
  data.clear();
  update();
  statusRequest = StatusRequest.loading;
  update();
  var response = await ordersPendingData.deleteData(orderid);
  print("Raw Response: $response");

  
  if (response == null || response is! Map) {
     print("Unexpected response format. Response: $response");
    statusRequest = StatusRequest.failure;
    print("Error: Response is null or not a Map. Response: $response");
  } else {
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
       refreshOrder();
      }
    } else {
      print("Unexpected response format: $response");
      statusRequest = StatusRequest.failure;
    }
  }

  update();
}
refreshOrder(){
  getOrder();
}

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }
}