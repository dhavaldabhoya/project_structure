import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_images.dart';
import 'package:project_structure/controller/Auth_Controller/network_connectivity_controller.dart';
import 'package:project_structure/controller/Auth_Controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashScreenController controller = Get.put(SplashScreenController());
  final NetWorkConnectivity netWorkConnectivity = Get.put(NetWorkConnectivity());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Image(
            image: AssetImage(AppImages.appLogo),
          ),
        ),
      ),
    );
  }
}
