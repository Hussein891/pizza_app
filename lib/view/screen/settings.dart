import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/controller/settings_controller.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/core/constant/onboardingimage.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class MySettings extends StatelessWidget {
  const MySettings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Scaffold(
      
      body: Container(child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [Container(
            height: Get.width/2,color: AppColor.premierColor,),
            Positioned(top:Get.width/2.5,child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(color: AppColor.white,borderRadius: BorderRadius.circular(100),),
              child: const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AppImageAsset.logo,),
              ),
            )),
          
            ],),
            const SizedBox(height: 60,),
               Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 10),
                child:  Card(child: Column(children: [
                  // ListTile(
                  //   onTap: () {
                      
                  //   },
                  //         title: const Text("Disable Notification"),
                  //         trailing:Switch(
                            
                  //           onChanged: (value) {
                            
                  //         },value: true,
                  //         ) ,
                  //       ),
                  //       const Divider(),
                        ListTile(
                          onTap: () {
                            Get.toNamed(AppRoute.ordersPending);
                          },
                          title:const Text("Orders"),
                          trailing: const Icon(Icons.card_travel_outlined),
                        ),
                      const  Divider(),
                        ListTile(
                          onTap: () {
                            Get.toNamed(AppRoute.ordersArchive);
                          },
                          title:const Text("Archive"),
                          trailing: const Icon(Icons.archive),
                        ),
                      const  Divider(),
                        ListTile(
                          onTap: () {
                            Get.toNamed(AppRoute.addressView);
                          },
                          title:const Text("Address"),
                          trailing: const Icon(Icons.location_on_outlined),
                        ),
                      const  Divider(),
                        ListTile(
                          onTap: () {
                            
                          },
                          title:const Text("About Us"),
                          trailing: const Icon(Icons.help_outline_rounded),
                        ),
                       const Divider(),
                         ListTile(
                          onTap: () {
                            launchUrl(Uri.parse("Tel:+971502742830"));
                          },
                          title:const Text("Contact Us"),
                          trailing: const Icon(Icons.phone_callback_outlined),
                        ),
                      const Divider(),
                         ListTile(
                          onTap: (){
                            controller.logOut();
                          },
                          title: const Text("Logout"),
                          trailing: const Icon(Icons.exit_to_app),
                        ),
                       
                      ],),),
              )
        ],
      ),),
    );
  }
}