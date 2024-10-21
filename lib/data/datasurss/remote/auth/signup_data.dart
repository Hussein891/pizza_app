import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  Future<dynamic> postData(String username,String email,String password,String phon ) async {
    var response = await crud.postData(AppLink.signUp, {
      "username":username,
      "email":email,
      "password":password,
      "phon":phon,
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
