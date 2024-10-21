import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class VerifiyCodeSignupData {
  Crud crud;
  VerifiyCodeSignupData(this.crud);

  Future<dynamic> postData(String email,String verifyCode) async {
    var response = await crud.postData(AppLink.verifiyCodeSignup, {
      
      "email":email,
      "verifiycode":verifyCode,
      
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

   Future<dynamic> resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {
      
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

