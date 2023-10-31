import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_images.dart';
import 'package:project_structure/config/app_textstyle.dart';

AppBar commonAppBar({required String title,

  List<Widget>? actions, required bool isLeading,
  bool? centerTitle,double? elevation}){
  return AppBar(
        backgroundColor: AppColors.backgroundColor,
        leadingWidth: 38,
        centerTitle: centerTitle,
        elevation: elevation??0.0,
      scrolledUnderElevation: 0.15,
        leading:(isLeading)?GestureDetector(
          onTap: () {
            Get.back();
          },
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset(AppImages.arrowBackImage,),
            )):null ,
        title: Text(title,style:AppTextStyle.appBarTitle),
        actions: actions,

      );
}