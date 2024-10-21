import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

   getData(String id) async {
    var response = await crud.postData(AppLink.favoriteView, {"id":id});
    return response.fold((l) => l, (r) => r); // لإرجاع الاستجابة الفعلية
  }

   deletData(String id) async {
    var response = await crud.postData(AppLink.favoriteDelet, {"id":id});
    return response.fold((l) => l, (r) => r); // لإرجاع الاستجابة الفعلية
  }
}
