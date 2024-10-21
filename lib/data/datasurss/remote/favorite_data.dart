import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

   addFavorite(String usersid,String itemsid) async {
    var response = await crud.postData(AppLink.favoriteAdd, {"usersid":usersid,"itemsid":itemsid});
    return response.fold((l) => l, (r) => r); // لإرجاع الاستجابة الفعلية
  }
   removeFavorite(String usersid,String itemsid) async {
    var response = await crud.postData(AppLink.favoriteRemove, {"usersid":usersid,"itemsid":itemsid});
    return response.fold((l) => l, (r) => r); // لإرجاع الاستجابة الفعلية
  }
}
