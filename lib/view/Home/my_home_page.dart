import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_images.dart';
import 'package:project_structure/controller/Home_Controllers/home_controller.dart';
import 'package:project_structure/view/Cart/cart_screen.dart';
import 'package:project_structure/view/Category/category_screen.dart';
import 'package:project_structure/view/Home/home_screen.dart';
import 'package:project_structure/view/Profile/profile_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeScreenController homeController = Get.put(HomeScreenController());
  List<Widget> screenList = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(child: Obx(() => screenList[homeController.selectedBottom.value])),
    );
  }

  Container bottomNavigationBar(){
    return Container(
      height: 60,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          boxShadow: const [
            BoxShadow(blurRadius: 1, color: AppColors.kBlack, spreadRadius: 0)
          ],
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() => (homeController.selectedBottom.value == 0)
              ? bottomIcon(image: AppImages.fillHome, selectIndex: 0)
              : bottomIcon(image: AppImages.home, selectIndex: 0)),
          Obx(() => (homeController.selectedBottom.value == 1)
              ? bottomIcon(image: AppImages.fillCategory, selectIndex: 1)
              : bottomIcon(image: AppImages.category, selectIndex: 1)),
          Obx(() => (homeController.selectedBottom.value == 2)
              ? bottomIcon(image: AppImages.fillCart, selectIndex: 2)
              : bottomIcon(image: AppImages.cart, selectIndex: 2)),
          Obx(() => (homeController.selectedBottom.value == 3)
              ? bottomIcon(image: AppImages.fillProfile, selectIndex: 3)
              : bottomIcon(image: AppImages.profile, selectIndex: 3)),
        ],
      ),
    );
  }

  GestureDetector bottomIcon({required String image, required selectIndex}) {
    return GestureDetector(
        onTap: () => homeController.selectBottom(selectedIndex: selectIndex),
        child: Image.asset(
          image,
          width: 24,
          height: 24,
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
