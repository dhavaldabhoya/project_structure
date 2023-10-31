import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/api_url.dart';
import 'package:project_structure/utils/global_variables.dart';
import 'package:project_structure/utils/http_handler.dart';

class CategoryController extends GetxController{
  RxList categoryList = [].obs;
  RxInt selectedCategory = 0.obs;
  RxList subCategoryList = [].obs;
  RxInt page = 1.obs;
  RxList productsDataList = [].obs;
  Future<void> getCategory({String?categoryId}) async {
    try {
      var response = await HttpHandler.getHttpMethod(url: ApiUrl.getCategory,);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        categoryList.value = data['data']['result'];
        if(categoryId != null){
          getSubCategory(categoryId);
          globalCategoryID.value = "";
          selectedCategory.value = categoryList.indexWhere((item) => item["id"].toString() == categoryId);
        }else{
          getSubCategory(categoryList[0]['id'].toString());
           selectedCategory.value = 0;
        }
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    }
  }
  Future<void> getSubCategory(String categoryId) async {
    try {
      var response = await HttpHandler.getHttpMethod(url: "${ApiUrl.getSubCategory}$categoryId",);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        subCategoryList.value = data['data']['result'];
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    }
  }
  Future<void> getItems({String?categoryId,String?subCategoryId , required String page}) async {
    var body = {"page":page};
    if(categoryId!=null){
      body.addAll({"category_id":categoryId});
    }
    if(subCategoryId != null){
      body.addAll({"sub_category_id":subCategoryId});
    }

    try {
      var response = await HttpHandler.postHttpMethod(url: ApiUrl.getItems,data: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        productsDataList.addAll(data['data']['result']['data']);
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    }
  }
}