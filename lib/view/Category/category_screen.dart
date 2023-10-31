import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_textstyle.dart';
import 'package:project_structure/controller/Category_Controllers/category_controller.dart';
import 'package:project_structure/utils/global_variables.dart';
import 'package:project_structure/widget/common_appbar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key,});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController categoryController = Get.put(CategoryController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(globalCategoryID.value!=""){
      categoryController.getCategory(categoryId: globalCategoryID.value);
    }else{
      categoryController.getCategory();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: "All Category", isLeading: false, centerTitle: true),
      body:Center(child: Text("Category Screen",style: AppTextStyle.appBarTitle,),)
    );
  }
}
