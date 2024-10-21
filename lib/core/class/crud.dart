
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          Map responsebody = parseJson(response.body);
          print(responsebody);
          return Right(responsebody);
        } catch (e) {
          print('Error parsing JSON: $e');
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }

  // وظيفة لتحليل استجابة تحتوي على أكثر من كائن JSON
  Map<String, dynamic> parseJson(String responseBody) {
    // إضافة أقواس حول الاستجابة لتكوين كائن JSON واحد
    if (responseBody.startsWith('{') && responseBody.endsWith('}')) {
      return jsonDecode(responseBody);
    }

    // محاولة فصل الكائنات إذا كانت الاستجابة تحتوي على أكثر من كائن JSON
    var parts = responseBody.split('}{');
    if (parts.length == 2) {
      parts[1] = '{${parts[1]}}';
      var combinedJson = '${parts[0]},${parts[1]}';
      return jsonDecode('{$combinedJson}');
    }
    throw const FormatException('Unable to parse response body');
  }
}
