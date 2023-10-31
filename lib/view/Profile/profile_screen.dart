import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_textstyle.dart';
import 'package:project_structure/controller/Profile_Controllers/profile_controller.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Text("Profile Screen",style: AppTextStyle.appBarTitle,),
        )
      ),
    );
  }
}
