import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/orders/archive_data.dart';
import 'package:pizzaapp/data/model/orders_model.dart';

class ArchiveController extends GetxController{
  MyServices myServices =Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel> data = [];
  ArchieData archieData = ArchieData(Get.find());
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
  var response = await archieData.getData(
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

submitRating(String ordersId,double rating,String comment)async {
  data.clear();
  update();
  statusRequest = StatusRequest.loading;
  update();
  var response = await archieData.ratingData(
   ordersId,rating.toString(),comment);
  print("Raw Response: $response");

  
  if (response == null || response is! Map) {
     print("Unexpected response format. Response: $response");
    statusRequest = StatusRequest.failure;
    print("Error: Response is null or not a Map. Response: $response");
  } else {
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
      getOrder();
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