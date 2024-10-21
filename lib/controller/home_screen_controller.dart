// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaapp/view/screen/home.dart';
import 'package:pizzaapp/view/screen/myfavoriet.dart';
import 'package:pizzaapp/view/screen/offers.dart';
import 'package:pizzaapp/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController{
changPage(int currentPage);
}
class HomeScreenControllerImp extends HomeScreenController{
  int currentPage=0;
  List<Widget> listPage=[
    const Home(),
    const MyFavoriet(),
    const OffersView(),
    const MySettings()
  ];
  
  List bottomAppBar =[
    {"title":"Home","icon":Icons.home},
    {"title":"Favorite","icon":Icons.favorite},
    {"title":"Offers","icon":Icons.shop_sharp},
    {"title":"Settings","icon":Icons.settings},
  ];


  @override
  changPage(int i) {
    currentPage = i;
    update();
  }

}