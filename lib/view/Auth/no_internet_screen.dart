import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_images.dart';
import 'package:project_structure/config/app_textstyle.dart';
import 'package:project_structure/controller/Auth_Controller/network_connectivity_controller.dart';

import 'package:project_structure/widget/common_button.dart';


class NoInterNet extends StatelessWidget {
   NoInterNet({super.key});
  final NetWorkConnectivity controller = Get.put(NetWorkConnectivity());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset(AppImages.noInterNetImage),
                const SizedBox(
                  height: 20,
                ),
                Text("Whoops!",
                    style: AppTextStyle.bold),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Slow or no internet connections.\nPlease check your internet settings",
                  style: AppTextStyle.regular,
                ),
                const SizedBox(
                  height: 25,
                ),
                CommonButton(text:  "Try Again", style:  AppTextStyle.semiBold.copyWith(fontWeight: FontWeight.w700, color: AppColors.kWhite), onTab:() {
                  controller.getConnectionType();
                }, ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
