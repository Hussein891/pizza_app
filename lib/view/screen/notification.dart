
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pizzaapp/controller/notification_controller.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // وضع NotificationController في GetX
    NotificationController controller = Get.put(NotificationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<NotificationController>(
          builder: (controller) {
         
            if (controller.statusRequest == StatusRequest.loading) {
              return const Center(child: CircularProgressIndicator()); // عرض مؤشر تحميل
            }

            if (controller.statusRequest == StatusRequest.failure) {
              return const Center(child: Text("Failed to load notifications")); // عرض رسالة فشل
            }

           
            if (controller.data.isEmpty) {
              return const Center(child: Text("No notifications available")); // عرض رسالة عند عدم وجود بيانات
            }

            // عرض البيانات في ListView
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(controller.data[index]['notification_title']),
                    subtitle: Text(controller.data[index]['notification_body']),
                    trailing: Text(Jiffy.parse(controller.data[index]['notification_detetime'].toString()).fromNow()),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
