class APiMange {
  static const String baseurl = "https://test.pisti.ae/api/v2";
  static const String baseurlImage = "https://test.pisti.ae";
  static const String categories = "$baseurl/categories";
  static const String products = "$baseurl/products/category";
  static const String bestseller = "$baseurl/products/best-seller";
  static const String productdetalis = "$baseurl/products";
  static const String login = "$baseurl/auth/login";
  static const String wishlists = "$baseurl/wishlists";
  static const String getfavorute = "$baseurl/wishlists"; //id
  static const String counters = "$baseurl/profile/counters"; //id
  static const String gteCartList = "$baseurl/carts"; //id
  static const String gteAddCartList = "$baseurl/carts/add"; //id
  static const String gteAddressuser = "$baseurl/user/shipping/address"; //id
  static const String getaddress = "$baseurl/user/shipping/address";
  static const String requestShope = "$baseurl/send-seller-request";
  static const String editShope = "$baseurl/update-seller-data";
  static const String sendcontact = "$baseurl/send-contact";
  static const String updatepro = "$baseurl/profile/update";
  // static const String products = "$baseurl/products/category";
  ///7?page=1
  // static const String forgotPasswordRoute = "/forgotPassword";
  // static const String resetPasswordRoute = "/resetPassword";
  static const String saveOrder = "$baseurl/order/store";
  static const String addproducts = "$baseurl/seller/seller-products";
//////////////////////////////////auth//////////////////////////////////////
  static const String logout = "$baseurl/auth/logout";
  static const String deletecart = "$baseurl/carts";
  static const String reset = "$baseurl/auth/password/confirm_reset";
  static const String signup = "$baseurl/auth/signup";
  static const String forget_request = "$baseurl/auth/password/forget_request";

  ///111
  //  static const String sendcontact = "$baseurl/send-contact";
}
