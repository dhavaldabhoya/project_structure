import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_textstyle.dart';
import 'package:project_structure/controller/Auth_Controller/auth_controller.dart';
import 'package:project_structure/view/Auth/forgot_password_screen.dart';
import 'package:project_structure/view/Home/my_home_page.dart';
import 'package:project_structure/widget/common_button.dart';
import 'package:project_structure/widget/common_texfild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final authController = Get.put(AuthController());
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: globalKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Sign in",
                  textAlign: TextAlign.start,
                  style: AppTextStyle.bold.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: AppTextStyle.medium,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Sign Up",
                        style: AppTextStyle.medium
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonTexField(
                  controller: authController.emailController.value,
                  hintText: 'Email ID',
                  labelText: '',
                  isEmailValidator: true,
                  needValidation: true,
                  maxLines: 1,
                  validationMessage: "Email",
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return CommonTexField(
                    controller: authController.passwordController.value,
                    hintText: 'Password',
                    visible: authController.passwordVisible.value,
                    needValidation: true,
                    validationMessage: "Password",
                    maxLines: 1,
                    suffix: InkWell(
                      onTap: () {
                        authController.passwordVisible.value =
                            authController.passwordVisible.value == true
                                ? false
                                : true;
                      },
                      child: authController.passwordVisible.value == false
                          ? const Icon(
                              Icons.visibility,
                              color: AppColors.primaryColor,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: AppColors.primaryColor,
                            ),
                    ),
                    labelText: '',
                    isPasswordValidator: true,
                  );
                }),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.to(() => const ForgotPassword());
                        },
                        child: Text(
                          "Forgot Password?",
                          style: AppTextStyle.regular.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonButton(
                  text: "Sign in",
                  style: AppTextStyle.semiBold.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.kWhite),
                  onTab: () async {
                    if (globalKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      Get.offAll(() => const MyHomePage());
                     // authController.login();
                    }
                     // Get.offAll(() => const MyHomePage());
                  },
                  backgroundColor: AppColors.primaryColor,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
