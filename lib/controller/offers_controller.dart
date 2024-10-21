
import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/data/datasurss/remote/offers_data.dart';
import 'package:pizzaapp/data/model/itemsmodel.dart';

class OffersController extends GetxController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    print("Response: $response"); // طباعة الاستجابة للتحقق منها
// response == null => (بكون في مشكل يا بسرفر يا بلينك الصفحه)
    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success && response is Map && response.containsKey('data')) {
       data.addAll((response['data'] as List).map((e) => ItemsModel.fromJson(e)).toList());
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
