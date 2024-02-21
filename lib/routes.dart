import 'package:e_gift_store_admin/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:e_gift_store_admin/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:e_gift_store_admin/view/screen/auth/forgetpassword/success_reset_password.dart';
import 'package:e_gift_store_admin/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:e_gift_store_admin/view/screen/auth/login.dart';
import 'package:e_gift_store_admin/view/screen/categories/add.dart';
import 'package:e_gift_store_admin/view/screen/categories/edit.dart';
import 'package:e_gift_store_admin/view/screen/categories/view.dart';
import 'package:e_gift_store_admin/view/screen/home.dart';
import 'package:e_gift_store_admin/view/screen/items/add.dart';
import 'package:e_gift_store_admin/view/screen/items/edit.dart';
import 'package:e_gift_store_admin/view/screen/items/view.dart';
import 'package:e_gift_store_admin/view/screen/language.dart';
import 'package:e_gift_store_admin/view/screen/notifications.dart';
import 'package:e_gift_store_admin/view/screen/orders/archive.dart';
import 'package:e_gift_store_admin/view/screen/orders/details.dart';
import 'package:e_gift_store_admin/view/screen/orders/pending.dart';
import 'package:e_gift_store_admin/view/screen/orders/screen.dart';
import 'package:e_gift_store_admin/view/screen/reports/customerfeedbackreport.dart';
import 'package:e_gift_store_admin/view/screen/reports/reports_options.dart';
import 'package:e_gift_store_admin/view/screen/reports/salesreport.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  // Auth
  GetPage(
      name: "/", page: () => const MyLanguage(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => const Cart()),

  GetPage(name: AppRoute.login, page: () => const Login()),
  // GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),

  //Order Screen
  // GetPage(name: AppRoute.ordersscreen, page: () => const OrderScreen()),

  //Home Page
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),

  //Orders
  GetPage(name: AppRoute.ordersscreen, page: () => const OrderScreen()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),

  //Categories
  GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesedit, page: () => const CategoriesEdit()),

  //Items
  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemssadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),

  //Notifications
  GetPage(name: AppRoute.notifications, page: () => const Notifications()),
  //Reports
  GetPage(name: AppRoute.reportoptions, page: () => const ReportOptions()),
  GetPage(name: AppRoute.salesreport, page: () => const SalesReport()),
  GetPage(
      name: AppRoute.customerfeedbackreport,
      page: () => const CustomerFeedbackReport()),
];
