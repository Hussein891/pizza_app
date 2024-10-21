import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzaapp/controller/address/add_controller.dart';
import 'package:pizzaapp/core/class/statusrequest.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/view/widget/hacdlindataview.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddressAddController controllerPage = Get.put(AddressAddController());
    return Scaffold(
      
       appBar: AppBar(
        backgroundColor: AppColor.premierColor,
        title: const Text("Add Now Address",style: TextStyle(color:AppColor.white ),),
        centerTitle: true,
        iconTheme:const IconThemeData(color: AppColor.white) ,
        
       ),
       body:  Container(
  child: GetBuilder<AddressAddController>(
    builder: (controller) {
      if (controller.statusRequest == StatusRequest.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.kGooglePlex != null) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      markers: controllerPage.markers.toSet(),
                      onTap: (latlong) {
                        controllerPage.addMarkers(latlong);
                      },
                      initialCameraPosition: controller.kGooglePlex!,
                      onMapCreated: (GoogleMapController controllermap) {
                        controller.completercontroller?.complete(controllermap);
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      child: MaterialButton(
                        minWidth: 200,
                        onPressed: (){
                          controllerPage.goToPageAddDetailsAddress();
                        },
                        color: AppColor.premierColor,
                        textColor: AppColor.white,
                        child:const Text("Continuo Add"),),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return const Center(child: Text("Unable to load map"));
      }
    },
  ),
)
    );
  }
}