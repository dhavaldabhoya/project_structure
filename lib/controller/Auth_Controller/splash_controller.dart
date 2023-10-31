import 'dart:async';
import 'package:get/get.dart';
import 'package:project_structure/utils/app_preferences.dart';
import 'package:project_structure/utils/constant.dart';
import 'package:project_structure/view/Auth/login_screen.dart';
import 'package:project_structure/view/Home/my_home_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    ConstData.accessToken.value = AppPreferences.getToken()??"";
    super.onInit();
    Timer(
      const Duration(seconds: 4),
      () {
        if (ConstData.accessToken.value == "") {
          Get.offAll(() => const LoginScreen());
        } else {
          ConstData.userId.value = AppPreferences.getUserId()!;
          ConstData.useName.value = AppPreferences.getUserName()!;
          ConstData.userEmail.value = AppPreferences.getUserEmail()!;
          ConstData.userImage.value = AppPreferences.getUserImages()!;

          Get.offAll(() => const MyHomePage());
        }
      },
    );
  }
}
