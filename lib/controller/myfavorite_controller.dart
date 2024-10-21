import 'package:get/get.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/functions/handlingdata.dart';
import 'package:pizzaapp/core/services/services.dart';
import 'package:pizzaapp/data/datasurss/remote/my_favorite_data.dart';
import 'package:pizzaapp/data/model/myfavoritemodel.dart';

class MyFavoriteController extends GetxController {

  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = []; 
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getData(
      myServices.sharedPreferences.getString("id")!);
    print("Response: $response");

    if (response == null) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        List responseData = response['data'] ?? [];
        data.clear(); 
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)).toList());
        print("data");
        print(data);
      } else {
        print("Unexpected response format: $response");
      }
    } 
    update();
  }

  // إضافة المنتج إلى الفوفرت
  addToFav(String productId) async {
    var response = await myFavoriteData.getData(productId);
    if (response != null) {
      await getData();  // تحديث البيانات بعد الإضافة
      update();  
    }
  }

  deletFromFav(String favoriteid) async {
    var response = await myFavoriteData.deletData(favoriteid);
    if (response != null) {
      data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
      update();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
