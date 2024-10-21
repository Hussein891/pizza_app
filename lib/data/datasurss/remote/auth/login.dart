import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  Future<dynamic> postData(String email,String password ) async {
    var response = await crud.postData(AppLink.login, {
      
      "email":email,
      "password":password,
      
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
