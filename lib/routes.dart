import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pizzaapp/core/constant/routes.dart';
import 'package:pizzaapp/core/middleware/mymiddlewaer.dart';
import 'package:pizzaapp/view/screen/address/add_address.dart';
import 'package:pizzaapp/view/screen/address/add_address_parttwo.dart';
import 'package:pizzaapp/view/screen/address/view_address.dart';
import 'package:pizzaapp/view/screen/auth/forgetpassword.dart';
import 'package:pizzaapp/view/screen/auth/login.dart';
import 'package:pizzaapp/view/screen/auth/resetpassword.dart';
import 'package:pizzaapp/view/screen/auth/signup.dart';
import 'package:pizzaapp/view/screen/auth/success_resetpassword.dart';
import 'package:pizzaapp/view/screen/auth/success_signup.dart';
import 'package:pizzaapp/view/screen/auth/verifycode.dart';
import 'package:pizzaapp/view/screen/auth/verifycodesignup.dart';
import 'package:pizzaapp/view/screen/cart.dart';
import 'package:pizzaapp/view/screen/checkout.dart';
//import 'package:pizzaapp/view/screen/home.dart';
import 'package:pizzaapp/view/screen/homescreen.dart';
import 'package:pizzaapp/view/screen/items.dart';
import 'package:pizzaapp/view/screen/language.dart';
import 'package:pizzaapp/view/screen/myfavoriet.dart';
import 'package:pizzaapp/view/screen/notification.dart';
import 'package:pizzaapp/view/screen/onboarding.dart';
import 'package:pizzaapp/view/screen/orders/archive.dart';
import 'package:pizzaapp/view/screen/orders/details.dart';
import 'package:pizzaapp/view/screen/orders/pending.dart';
import 'package:pizzaapp/view/screen/productdetails.dart';
import 'package:pizzaapp/view/screen/settings.dart';
//import 'package:pizzaapp/view/screen/productdetails.dart';
import 'package:pizzaapp/view/test_data_view.dart';

List<GetPage<dynamic>>? routes = [
  //GetPage(name:"/",page:()=>const ProductDetails()),
  
  GetPage(name:"/", page: ()=> const Language() ,middlewares: [
  MyMiddleWare()
]),
//auth
GetPage(name:AppRoute.login, page: ()=> const Login()),
GetPage(name:AppRoute.singUp, page: ()=> const SignUp()),
GetPage(name:AppRoute.forgetPassword, page: ()=> const ForgetPassword()),
GetPage(name:AppRoute.forgetPassword, page: ()=> const ForgetPassword()),
GetPage(name:AppRoute.resetPassword, page: ()=> const ResetPassword()),
GetPage(name:AppRoute.verifyCode, page: ()=> const VerfiyCode()),
GetPage(name:AppRoute.verifyCodeSignUp, page: ()=>const VerfiyCodeSignUp()),
GetPage(name:AppRoute.successSignUp, page: ()=>const SuccessSignUp()),
GetPage(name:AppRoute.successResetPassword, page: ()=>const SuccessResetPassword()),
//onboarding
GetPage(name:AppRoute.onBoarding, page: ()=>const Onboarding()),
GetPage(name:AppRoute.testView, page: ()=>const TestView ()),
//
GetPage(name:AppRoute.home, page: ()=>const HomeScreen()),
GetPage(name:AppRoute.notification, page: ()=>const NotificationPage()),
GetPage(name:AppRoute.items, page: ()=>const ItemsPage()),
GetPage(name:AppRoute.productDetails, page: ()=>const ProductDetails()),
GetPage(name:AppRoute.myFavoriet, page: ()=>const MyFavoriet()),
GetPage(name:AppRoute.mySettings, page: ()=>const MySettings()),
GetPage(name:AppRoute.cart, page: ()=>const Cart()),
//Address
GetPage(name:AppRoute.addressView, page: ()=>const AddressView()),
GetPage(name:AppRoute.addressAdd, page: ()=>const AddressAdd()),
GetPage(name:AppRoute.addressAddPartTwo, page: ()=>const AddressAddPartTwo()),
//

GetPage(name:AppRoute.checkOut, page: ()=>const CheckOut()),
GetPage(name:AppRoute.ordersPending, page: ()=>const OrdersPending()),
GetPage(name:AppRoute.ordersDetails, page: ()=>const OrderDetails()),
GetPage(name:AppRoute.ordersArchive, page: ()=>const OrdersArchive()),

];







