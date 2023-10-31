import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_colors.dart';

class CommonButton extends StatelessWidget {
 final String text;
 final Color? borderColor;
  final Color? backgroundColor;
 final  TextStyle style;
 final Function() onTab;

   const CommonButton({super.key, required this.text, this.borderColor,required this.style,required this.onTab,this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        height: Get.height / 15,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          border: Border.all(color: borderColor ?? Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text,style: style,),
      ),
    );
  }
}
