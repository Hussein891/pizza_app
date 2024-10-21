import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/test_data_controller.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';

class TestView extends StatelessWidget {
  
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: GetBuilder<TestController>(builder: (controller){
        if(controller.statusRequest==StatusRequest.loading){
          return const Center(child: Text("Loading"),);
        }else if(controller.statusRequest==StatusRequest.offlineFailure){
          return const Center(child: Text("offline Failure"),);
        }else if(controller.statusRequest==StatusRequest.serverFailure){
          return const Center(child: Text("server Failure"),);
        }else{
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder:(context,index){
          return Text("${controller.data}");
            });
        }
      }
      )
      );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pizzaapp/controller/test_data_controller.dart';
// import 'package:pizzaapp/core/constant/color.dart';
// import 'package:pizzaapp/view/widget/hacdlindataview.dart';

// class TestView extends StatelessWidget {
//   const TestView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(TestController());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Title'),
//         backgroundColor: AppColor.premierColor,
//       ),
//       body: GetBuilder<TestController>(
//         builder: (controller) {

//           return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
//               itemCount: controller.data.length,
//               itemBuilder: (context, index) {
//                 var item = controller.data[index];
//                 return ListTile(
//                   title: Text(item.toString()), // تعديل حسب بنية البيانات
//                 );
//               },
//             ),
//             );

          
//         },
//       ),
//     );
//   }
// }
