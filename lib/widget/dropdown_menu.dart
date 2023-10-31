import 'package:flutter/material.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_textstyle.dart';

Widget dropdownView({
  List<String>? dataList,
  bool? color = true,
  String? hintText,
  double? hintTextSize,
  Function(String?)? onChange,
  bool isDropDownValidation = true,
  String? value,
  double? rightPadding,
  double? leftPadding,
  double? topPadding,
  double? bottomPadding,
  String? labelText,
}) {
  return Container(
    color: color == true ? Colors.white : AppColors.primaryColor,
    padding: EdgeInsets.only(
        // left: leftPadding ?? 15,
        // right: rightPadding ?? 15,
        top: topPadding ?? 8,
        bottom: bottomPadding ?? 5),
    child: DropdownButtonFormField(
      style: AppTextStyle.regular,
      elevation: 10,
      isExpanded: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText ?? "Select Any Item",
        // fillColor: Colors.red,
        filled: true,
        focusColor: Colors.white,
        hintStyle: AppTextStyle.regular.copyWith(fontSize: 14),
        // border: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        alignLabelWithHint: false,
        labelText: labelText ?? "",
        labelStyle: AppTextStyle.regular.copyWith(fontSize: 14),
        contentPadding: EdgeInsets.fromLTRB(
          leftPadding ?? 10,
          topPadding ?? 0,
          rightPadding ?? 0,
          bottomPadding ?? 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.transparentColor,
            width: 1,
          ),
        ),
      ),
      items: dataList!.map((e) {
        return DropdownMenuItem(
            value: e,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: leftPadding != null ? 0 : 15,
                  ),
                  Text(
                    e,
                    style: AppTextStyle.regular
                        .copyWith(fontSize: 13, color: AppColors.kBlack),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ));
      }).toList(),
      hint: Row(
        children: [
          SizedBox(
            width: leftPadding != null ? 0 : 15,
          ),
          Text(
            hintText!,
            style: AppTextStyle.semiBold.copyWith(
                fontSize: hintTextSize ?? 12,
                color: AppColors.kBlack.withOpacity(0.5),
                letterSpacing: 0.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      icon: const Row(
        children: [
          Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 25,
          ),
          SizedBox(width: 10),
        ],
      ),
      validator: isDropDownValidation
          ? (value) => value == null ? 'Role required!' : null
          : null,
      value: value,
      isDense: true,
      alignment: Alignment.center,
      borderRadius: BorderRadius.circular(5),
      dropdownColor: AppColors.kWhite,
      onChanged: onChange,
    ),
  );
}
