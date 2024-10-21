import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/data/datasurss/remote/details_data.dart';
import 'package:pizzaapp/data/model/cartmodel.dart';
import 'package:pizzaapp/data/model/orders_model.dart';

class OrderDetailsController extends GetxController{
   Completer<GoogleMapController>? completercontroller ;
   Position? position;
  List<Marker> markers = [];
  CameraPosition? cameraPosition;
  OrdersModel? ordersModel;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;

initialData(){
  if(ordersModel!.ordersType == 0){
cameraPosition =CameraPosition(
    target: LatLng(ordersModel!.addressLat!,ordersModel!.addressLong!),
    zoom: 14.4746,
  );
  markers.add(Marker(markerId: const MarkerId("1"),position:LatLng(ordersModel!.addressLat!,ordersModel!.addressLong!), ));
  }
    
}


  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initialData();
        getData();
    super.onInit();
  }
  

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getData(ordersModel!.ordersId!.toString());
    print("Response: $response"); // طباعة الاستجابة للتحقق منها
// response == null => (بكون في مشكل يا بسرفر يا بلينك الصفحه)
    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        List listdata = response['data'];
        data.addAll(listdata.map((e)=>CartModel.fromJson(e)));
      } else {
        print("Unexpected response format: $response");
      }
    }

    update();
  }


}