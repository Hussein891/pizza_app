// ignore_for_file: override_on_non_overriding_member

import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/address_data.dart';
import 'package:pizzaapp/data/datasurss/remote/checkout_data.dart';
import 'package:pizzaapp/data/model/address_model.dart';

class CheckOutController extends GetxController{
StatusRequest statusRequest = StatusRequest.none;
AddressData addressData = Get.put(AddressData(Get.find()));
CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));
List<AddressModel> dataAddress=[];
MyServices myServices = Get.find();
String? paymentMethod;
String? deliveryType;
String addressId= "0";
String? couponid;
String? coupondiscount;
String? priceorder;

choosePaymentMethod(String val){
paymentMethod = val;
update();
}
chooseDeliveryType(String val){
deliveryType = val;
update();
}
chooseAddress(String val){
addressId = val;
print(val);
update();
}

getShippingAddress() async {
  statusRequest = StatusRequest.loading;
  var response = await addressData.getData(
    myServices.sharedPreferences.getString("id")!);
  print("Response: $response");

  // التحقق من أن الاستجابة تحتوي على البيانات
  if (response == null || response['data'] == null || response['data'].isEmpty) {
   Get.toNamed(AppRoute.addressAdd);
    return Get.snackbar("Error", "Please Add Address");
    
  } else {
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      List listdata = response['data'];
      dataAddress = listdata.map((e) => AddressModel.fromJson(e)).toList(); 
      addressId=dataAddress[0].addressId.toString();
      update();
    } else {
      print("Unexpected response format: $response");
    }
  }

  update();
}



  checkOut()async {
    if(paymentMethod==null)return Get.snackbar("Error", "Please Select a Payment Method");
       if(deliveryType==null)return Get.snackbar("Error", "Please Select a order type");
       if(dataAddress.isEmpty){
        return Get.snackbar("Error", "Please Add Address");
       }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
    "usersid":myServices.sharedPreferences.getString("id"),
    "addressid":addressId.toString(),
    "orderstype":deliveryType.toString(),
    "pricedelivery":"10",
    "ordersprice":priceorder,
    "couponid":couponid,
    "coupondiscount":coupondiscount.toString(),
    "paymentmethod":paymentMethod.toString(),
    };
    var response = await checkOutData.checkOut(data);
    
    print("Response: $response"); // طباعة الاستجابة للتحقق منها
// response == null => (بكون في مشكل يا بسرفر يا بلينك الصفحه)
    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
       Get.offAllNamed(AppRoute.home);
       Get.snackbar("Success", "The Order was Successfully");
      } else {
        print("Unexpected response format: $response");
        Get.snackbar("Error", "Try Again");
      }
    }

    update();
  }
  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['diescountcopupn'];
    getShippingAddress();
    super.onInit();
  }
  @override
void initState() {
 
  getShippingAddress();
}

}

