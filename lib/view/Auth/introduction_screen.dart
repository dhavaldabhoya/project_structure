import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_images.dart';
import 'package:project_structure/view/Home/my_home_page.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlack,
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60,),
            const Image(image: AssetImage(AppImages.appLogo),height: 360,width: 360,),
            const SizedBox(height: 15,),
            const Padding(
              padding: EdgeInsets.symmetric(vertical:15,horizontal: 32),
              child: Text('Effortlessly manage your tasks, set priorities, and achieve your goals. Experience productivity like never before with our App'),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.offAll(()=>const MyHomePage());
              },
              child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.kWhite,
                ),
                alignment: Alignment.center,
                child: const Text("Start",)),
              ),
            const SizedBox(height: 30,),
          ],
        ),
      )),
    );
  }
}
