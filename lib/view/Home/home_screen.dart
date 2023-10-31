import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_textstyle.dart';
import 'package:project_structure/controller/Home_Controllers/home_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  final HomeScreenController homeController = Get.put(HomeScreenController());
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getHomeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text("Home",style: AppTextStyle.appBarTitle,),
      ),
    );
  }
}
