import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/api_url.dart';
import 'package:project_structure/utils/app_preferences.dart';
import 'package:project_structure/utils/http_handler.dart';
import 'package:project_structure/view/Auth/login_screen.dart';

class ProfileController extends GetxController{
  Future<void> getLogOut() async {
    try {
      var response = await HttpHandler.getHttpMethod(url: ApiUrl.logOutUrl,);
      if (response.statusCode == 200) {
        AppPreferences.clearAll();
        Get.offAll(()=>const LoginScreen());
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    }
  }
}