import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class CheckOutData{
  Crud crud;
  CheckOutData(this.crud);
  checkOut(Map data)async{
    var response = await crud.postData(AppLink.checkOut, data);
    return response.fold((l)=>1, (r)=>1);
  }
}
