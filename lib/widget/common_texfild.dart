// ignore_for_file: unnecessary_null_in_if_null_operators
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_textstyle.dart';
import 'package:project_structure/utils/validator.dart';

class CommonTexField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsetsGeometry? contentPadding;
  final Color? bgColor;
  final Function(String v)? onChange;
  final Function()? onTap;
  final bool? readOnly;
  final Color? color;
  final TextStyle? hintStyle;
  final bool? needValidation;
  final bool? isEmailValidator;
  final bool? isCardValidator;
  final bool? isCardCvvValidator;
  final bool? isCardDateValidator;
  final bool? isPasswordValidator;
  final bool? isPhoneNumberValidator;
  final bool? isPinCodeNumberValidator;
  final String? validationMessage;
  final TextInputType? inputType;
  final bool? visible;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final double? height;
  final double borderRadius;
  final List<TextInputFormatter>? inputFormatters;

  const CommonTexField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.prefix,
      this.suffix,
      this.contentPadding,
      this.hintStyle,
      required this.labelText,
      this.bgColor,
      this.onChange,
      this.readOnly,
      this.color,
      this.needValidation = false,
      this.isEmailValidator = false,
      this.isCardValidator = false,
      this.isCardCvvValidator = false,
      this.isCardDateValidator = false,
      this.isPasswordValidator = false,
      this.isPhoneNumberValidator = false,
      this.isPinCodeNumberValidator = false,
      this.validationMessage,
      this.inputType,
      this.inputFormatters,
      this.visible,
      this.onTap,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.height,
      this.borderRadius = 10})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onTap: onTap,
        obscureText: visible ?? false,
        keyboardType: inputType,
        maxLength: maxLength,
        maxLines: maxLines,
        minLines: minLines,
        inputFormatters: inputFormatters,
        cursorColor: AppColors.primaryColor,
        validator: needValidation ?? false
            ? (v) {
                return TextFieldValidation.validation(
                    isCardValidator: isCardValidator ?? false,
                    isCardCvvValidator: isCardCvvValidator ?? false,
                    isCardDateValidator: isCardDateValidator ?? false,
                    isEmailValidator: isEmailValidator ?? false,
                    isPasswordValidator: isPasswordValidator ?? false,
                    isPhoneNumberValidator: isPhoneNumberValidator ?? false,
                    isPinCodeValidator: isPinCodeNumberValidator ?? false,
                    message: validationMessage,
                    value: v!.trim());
              }
            : null,
        onChanged: onChange,
        readOnly: readOnly ?? false,
        controller: controller,
        style: AppTextStyle.semiBold.copyWith(
          fontSize: 14,
          color: color ?? AppColors.secondaryColor,
        ),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          suffixIcon: suffix ?? null,
          prefixIcon: prefix ?? null,
          contentPadding: contentPadding ??
              const EdgeInsets.only(top: 18, left: 14, right: 14, bottom: 18),
          hintText: hintText,
          hintStyle: hintStyle ??
              AppTextStyle.medium.copyWith(
                fontSize: 14,
                color: AppColors.secondaryColor.withOpacity(0.6),
              ),
          filled: true,
          fillColor: bgColor ?? AppColors.kWhite,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: AppColors.borderGray,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: AppColors.borderGray,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: AppColors.borderGray,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.redAccent,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
