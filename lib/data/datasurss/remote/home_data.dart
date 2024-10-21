import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

   getData() async {
    var response = await crud.postData(AppLink.home,{});

    return response.fold(
      (l) {
        print("Error: $l"); // طباعة الخطأ للتحقق منه
        return null; // يمكنك تعديل هذا لإرجاع قيمة أخرى في حالة الخطأ
      },
      (r) {
        print("Success: $r"); // طباعة الاستجابة للتحقق منها
        return r;
      },
    );
  }
  searchData(String search) async {
    var response = await crud.postData(AppLink.searchItems,{"search":search});

    return response.fold(
      (l) {
        print("Error: $l"); // طباعة الخطأ للتحقق منه
        return null; // يمكنك تعديل هذا لإرجاع قيمة أخرى في حالة الخطأ
      },
      (r) {
        print("Success: $r"); // طباعة الاستجابة للتحقق منها
        return r;
      },
    );
  }
}
