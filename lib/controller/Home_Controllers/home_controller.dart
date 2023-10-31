import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/api_url.dart';
import 'package:project_structure/utils/http_handler.dart';

class HomeScreenController  extends GetxController{
  RxInt selectedBottom = 0.obs;
  var homeData = {}.obs;
  RxList banner = [].obs;
  RxList bannerImage = [].obs;
  RxList category = [].obs;
  RxList featureProduct = [].obs;
  RxList bestsellerProduct = [].obs;
  RxList productsDataList = [].obs;
  void selectBottom({required selectedIndex}){
    selectedBottom.value = selectedIndex;
  }
  Future<void> getHomeData() async {
    try {
      var response = await HttpHandler.getHttpMethod(url: ApiUrl.getHomeData,);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        homeData.value = data['data']['result'];
        banner.value = homeData['banner'];
        category.value=homeData['category'];
        featureProduct.value = homeData['feature'];
        bestsellerProduct.value = homeData['bestseller'];

        log("====>>> $data");
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    }
  }
  Future<void> getFutureProducts() async {
    try {
      var response = await HttpHandler.getHttpMethod(url: ApiUrl.getFeatureProduct,);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        productsDataList.value = data['data']['result'];
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    }
  }
  Future<void>getBestSellerProducts()async {
    try {
      var response = await HttpHandler.getHttpMethod(url: ApiUrl.getBestSellerProduct,);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        productsDataList.value = data['data']['result'];
      }
    } catch (e) {
      debugPrint('Error while getting data is $e');
    }
  }
}