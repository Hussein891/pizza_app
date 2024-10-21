import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class VerifyCodeForgetPassData {
  Crud crud;
  VerifyCodeForgetPassData(this.crud);

  Future<dynamic> postData(String email,String verifiycode ) async {
    var response = await crud.postData(AppLink.verifyCodePass, {
      
      "email":email,
      "verifiycode":verifiycode,
      
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

