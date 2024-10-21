import 'package:flutter/material.dart';
import 'package:pizzaapp/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
        fontFamily: "RobotoCondensed",
        appBarTheme:const AppBarTheme(
          backgroundColor: AppColor.premierColor,
          centerTitle: true,
          elevation: 0,
          iconTheme:  IconThemeData(color: AppColor.white),
          titleTextStyle: TextStyle(color: AppColor.white,
          fontWeight:FontWeight.bold,
          fontSize: 30,
          ),
        ),
        textTheme:  const TextTheme(
          bodyMedium: TextStyle(height: 2,color: AppColor.grey),
          bodyLarge: TextStyle(height: 2,color: AppColor.blake,fontSize: 25,),
        ),
         
      );
      ThemeData themeArabic = ThemeData(
        fontFamily: "Fustat",
        textTheme:  const TextTheme(
          bodyMedium: TextStyle(height: 2,color: AppColor.grey),
          bodyLarge: TextStyle(height: 2,color: AppColor.blake,fontSize: 25,)
        ),
         
      );