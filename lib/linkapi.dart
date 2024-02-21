class AppLink {
  static const String server = "https://egiftyemen.com/egift";

  //==============================Images from backend===========================
  static const String networkImage = "https://egiftyemen.com/egift/upload";
  static const String imageCategory = "$networkImage/categories";
  static const String imageItems = "$networkImage/items";

////=========================================================

  static const String notification = "$server/notification.php";
  static const String test = "$server/test.php";

  //=================================Auth=======================================

  static const String signUp = "$server/delivery/auth/signup.php";
  static const String verifyCodeSignUp = "$server/admin/auth/verifycode.php";
  static const String login = "$server/admin/auth/login.php";
  static const String resend = "$server/admin/auth/resend.php";

//=================================ForgetPassword===============================
  static const String checkEmail =
      "$server/admin/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$server/admin/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$server/admin/forgetpassword/resetpassword.php";

//=================================Home=========================================
  static const String homePage = "$server/home.php";

  // //Items
  // static const String items = "$server/items/items.php";
  // static const String searchitems = "$server/items/search.php";
  //
  // //Favorite
  // static const String favoriteAdd = "$server/favorite/add.php";
  // static const String favoriteRemove = "$server/favorite/remove.php";
  // static const String favoriteView = "$server/favorite/view.php";
  // static const String deleteFromFavorite =
  //     "$server/favorite/deletefromfavroite.php";

//=================================CART=========================================

//   static const String cartview = "$server/cart/view.php";
//   static const String cartadd = "$server/cart/add.php";
//   static const String cartdelete = "$server/cart/delete.php";
//   static const String cartgetcountitem = "$server/cart/getcountitems.php";
//
// //=================================Address=====================================
//   static const String addressAdd = "$server/address/add.php";
//   static const String addressDelete = "$server/address/delete.php";
//   static const String addressEdit = "$server/address/edit.php";
//   static const String addressView = "$server/address/view.php";
//
//   //=================================Coupon=====================================
//
//   static const String checkcoupon = "$server/coupon/checkcoupon.php";

  //==============================Checkout =====================================

  // static const String checkout = "$server/orders/checkout.php";
//==============================ORDERS==========================================

  static const String approveOrders = "$server/admin/orders/approve.php";
  static const String prepare = "$server/admin/orders/prepare.php";

  static const String viewarchiveOrders = "$server/admin/orders/archive.php";
  static const String viewpendingOrders =
      "$server/admin/orders/viewpending.php";
  static const String viewacceptedOrders =
      "$server/admin/orders/viewaccepted.php";
  static const String detailsOrders = "$server/admin/orders/details.php";

  static const String doneOrders = "$server/admin/orders/done.php";

  //Categories
  static const String categoriesview = "$server/admin/categories/view.php";
  static const String categoriesadd = "$server/admin/categories/add.php";
  static const String categoriesedit = "$server/admin/categories/edit.php";
  static const String categoriesdelete = "$server/admin/categories/delete.php";

  //Items
  static const String itemsview = "$server/admin/items/view.php";
  static const String itemsadd = "$server/admin/items/add.php";
  static const String itemsedit = "$server/admin/items/edit.php";
  static const String itemsdelete = "$server/admin/items/delete.php";

  //Notifications
  static const String send_notification = "$server/admin/notifications.php";

  //Report
  static const String salesReport =
      "$server/admin/reports/view_sales_report.php";
  static const String customerFeedback =
      "$server/admin/reports/customer_feedback_report.php";

  // static const String rating = "$server/delivery/rating.php";
  // //==============================ORDERS OFFERS================================
  // static const String offers = "$server/offers.php";
}
