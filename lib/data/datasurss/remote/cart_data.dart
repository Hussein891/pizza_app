import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

   addCart(String usersid,String itemsid) async {
    var response = await crud.postData(AppLink.cartAdd, {"usersid":usersid,"itemsid":itemsid});
    return response.fold((l) => l, (r) => r); // لإرجاع الاستجابة الفعلية
  }
   deletCart(String usersid,String itemsid) async {
    var response = await crud.postData(AppLink.cartDelet, {"usersid":usersid,"itemsid":itemsid});
    return response.fold((l) => l, (r) => r); // لإرجاع الاستجابة الفعلية
  }
   getCountCart(String usersid,String itemsid) async {
    var response = await crud.postData(AppLink.cartGetCountItems, {"usersid":usersid,"itemsid":itemsid});
    return response.fold((l) => l, (r) => r); // لإرجاع الاستجابة الفعلية
  }

   viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartView, {"usersid":usersid});
    return response.fold((l) => l, (r) => r); // لإرجاع الاستجابة الفعلية
  }
  checkCoupon(String couponname) async {
    var response = await crud.postData(AppLink.checkCoupon, {"couponname":couponname});
    return response.fold((l) => l, (r) => r); // لإرجاع الاستجابة الفعلية
  }
}
