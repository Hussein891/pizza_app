import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/routes.dart';

class AddressAddController extends GetxController{
  Completer<GoogleMapController>? completercontroller ;
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;

  double? lat;
  double? long;

     addMarkers(LatLng latLng){
      markers.clear();
      markers.add(Marker(markerId: const MarkerId("1"),position: latLng));
      lat = latLng.latitude;
      long = latLng.longitude;
      update();
     }
     goToPageAddDetailsAddress(){
      Get.toNamed(AppRoute.addressAddPartTwo,arguments: {
      "lat":lat.toString(),
      "long":long.toString(),
      });
     }
      getCurrentLocation()async{
        position = await Geolocator.getCurrentPosition();
        kGooglePlex =   CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    zoom: 14.4746,
  );
   addMarkers( LatLng(position!.latitude, position!.longitude));
  statusRequest =StatusRequest.none;
  update();
      }

      @override
  void onInit() {
    getCurrentLocation();
    completercontroller=Completer<GoogleMapController>();
    super.onInit();
  }

}