import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class OrdersPendingData{
  Crud crud;
  OrdersPendingData(this.crud);
   getData(String userid) async {
    var response = await crud.postData(AppLink.orderpending, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
   deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
