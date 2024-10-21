import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  Future<dynamic> postData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email":email,
    });
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

