import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/api_url.dart';
import 'package:project_structure/utils/app_preferences.dart';
import 'package:project_structure/utils/constant.dart';
import 'package:project_structure/utils/http_handler.dart';
import 'package:project_structure/view/Home/my_home_page.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool passwordVisible = true.obs;
  RxString email = "".obs;
  RxString password = "".obs;
  var loginData = {}.obs;

  Future<void> login() async {
    try {
      var response =
          await HttpHandler.postHttpMethod(url: ApiUrl.loginUrl, data: {
        "email": emailController.value.text.toString(),
        "password": passwordController.value.text.toString()
      });
      loginData.value = json.decode(response.body);
      if (response.statusCode == 200) {
        log("===>>$loginData");
        ConstData.userId.value = loginData['user']['id'];
        ConstData.useName.value = loginData['user']['name'];
        ConstData.userEmail.value = loginData['user']['email'];
        ConstData.accessToken.value = loginData['authorization']['token'];

        AppPreferences.setToken(token: ConstData.accessToken.value);
        AppPreferences.setUserId(userID: ConstData.userId.value);
        AppPreferences.setUserName(userName: ConstData.useName.value);
        AppPreferences.setUserEmail(userEmail: ConstData.userEmail.value);

        if(loginData['user']['image'] != null){
          ConstData.userImage.value = loginData['user']['image_path'];
          AppPreferences.setUserImage(userImage: ConstData.userImage.value);
          // await pref!.setString('userImage', ConstData.userImage.value);
        }else{
          ConstData.userImage.value = "null";
          AppPreferences.setUserImage(userImage: ConstData.userImage.value);
          //await pref!.setString('userImage', "null");
        }
        Get.offAll(() => const MyHomePage());
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    }
  }
  Future<void> forgotPassword() async {
    try {
      var response =
      await HttpHandler.postHttpMethod(url: ApiUrl.forgotPassWordUrl, data: {
        "email": emailController.value.text.toString(),
      });
      if (response.statusCode == 200) {
        var forgotBody = jsonDecode(response.body);
        var message = forgotBody['data']['message'];
        ConstData.showToastMessage(toastMessage: message);
        Get.back();
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    }
  }
}
