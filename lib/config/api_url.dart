class ApiUrl{
  static const String baseUrl = "http:/baseurl.com/";

  /// ==== Auth Module ==== \\\\
  static const String loginUrl = "login";
  static const String forgotPassWordUrl = "forgot-password";
  static const String logOutUrl = "logout";

  /// ==== Home Module ==== \\\\
  static const String getHomeData = "home";
  static const String getFeatureProduct = "feature";
  static const String getBestSellerProduct = "best-seller/";
  static const String getProductsDetails = "item/";

  /// ==== Category Module ==== \\\\
  static const String getCategory = "category";
  static const String getSubCategory = "sub-category/";
  static const String getItems = "item";

  /// ==== Profile Module ==== \\\\
  static const String getProfile = "profile";
  static const String updateProfile = "profile-update/";
  static const String getAddress = "address";
  static const String addAddress = "address/create";
  static const String updateAddress = "address/edit/";
  static const String deleteAddress = "address/delete/";
}