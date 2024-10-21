import 'package:pizzaapp/core/class/crud.dart';
import 'package:pizzaapp/linkapp.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String id,String usersid) async {
    var response = await crud.postData(AppLink.items, {"id":id.toString(),"usersid":usersid});
    return response.fold((l) => l, (r) => r); // لإرجاع الاستجابة الفعلية
  }
}
