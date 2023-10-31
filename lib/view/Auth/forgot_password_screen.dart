import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_images.dart';
import 'package:project_structure/config/app_textstyle.dart';
import 'package:project_structure/controller/Auth_Controller/auth_controller.dart';
import 'package:project_structure/widget/common_appbar.dart';
import 'package:project_structure/widget/common_button.dart';
import 'package:project_structure/widget/common_texfild.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final authController = Get.put(AuthController());
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: commonAppBar(title: "", isLeading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Forgot password?",
                style: AppTextStyle.semiBold.copyWith(fontSize: 32),
              ),
              Text(
                "Don’t worry..!! enter the email you used while registration.",
                style: AppTextStyle.regular.copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                AppImages.forgotPasswordImage,
                width: Get.width,
                height: Get.height / 2.8,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Forgot Password",
                textAlign: TextAlign.start,
                style: AppTextStyle.bold.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: globalKey,
                child: CommonTexField(
                  controller: authController.emailController.value,
                  hintText: 'Email ID',
                  labelText: 'Email ID',
                  isEmailValidator: true,
                  needValidation: true,
                  validationMessage: "Email",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CommonButton(
                text: "Send",
                style: AppTextStyle.semiBold.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.kWhite),
                onTab: () async {
                  if (globalKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    authController.forgotPassword();
                  }
                },
                backgroundColor: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
