import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  Future<dynamic> postData(String email,String password ) async {
    var response = await crud.postData(AppLink.resetPassword, {
      
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
