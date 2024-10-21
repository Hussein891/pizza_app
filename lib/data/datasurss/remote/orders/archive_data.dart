import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class ArchieData{
  Crud crud;
  ArchieData(this.crud);
   getData(String userid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
  ratingData(String ordersId,String rating,String comment) async {
    var response = await crud.postData(AppLink.rating, {"id": ordersId,"rating":rating,"comment":comment});
    return response.fold((l) => l, (r) => r);
  }
}
