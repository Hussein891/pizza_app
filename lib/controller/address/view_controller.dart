// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:get/get.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/address_data.dart';
import 'package:pizzaapp/data/model/address_model.dart';
import '../../core/class/statusrequest.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

Future<void> deleteAddress(String addressid) async {
  await addressData.deleteData(addressid);
  await getData(); // إعادة تحميل البيانات
  update();
}


 getData() async {
  statusRequest = StatusRequest.loading;
  update();

  try {
    var response = await addressData.getData(myServices.sharedPreferences.getString("id")!);
    print("Raw Response: $response");

    // تحقق من شكل الاستجابة الفعلي
    if (response is String) {
      
      var splitResponse = response.split(RegExp(r'\}\s*\{'));
      if (splitResponse.length > 1) {
        // ignore: prefer_interpolation_to_compose_strings
        response = jsonDecode('{' + splitResponse[0] + '}');
        print("Parsed Response: $response");
      } else {
        response = jsonDecode(response);
        print("Parsed Response: $response");
      }
    }

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List<dynamic> listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  } catch (e) {
    print("Error parsing JSON: $e");
    statusRequest = StatusRequest.serverFailure;
  }

  update();
}


  @override
  void onInit() {
  
    getData();
    super.onInit();
  }
}
