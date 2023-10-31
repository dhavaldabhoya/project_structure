import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_structure/view/Auth/no_internet_screen.dart';

class NetWorkConnectivity extends GetxController {
  RxInt connectionType = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription streamSubscription;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getConnectionType();
    streamSubscription = _connectivity.onConnectivityChanged.listen(_updateState);
  }
  Future<void>getConnectionType()async{
    ConnectivityResult connectivityResult;

    try {
      connectivityResult = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      // Handle the exception by assigning a default value or some appropriate behavior
      connectivityResult = ConnectivityResult.none; // Assign a default value
    }
    return _updateState(connectivityResult);
  }
  _updateState(ConnectivityResult result){
    switch (result){
      case ConnectivityResult.wifi:
        connectionType.value =1;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType.value =1;
        update();
        break;
      case ConnectivityResult.none:
        connectionType.value =0;
        update();
        break;
      default:Get.snackbar("Title", "message");
      break;
    }
    if(connectionType.value == 0){
      Get.to(()=>NoInterNet());
    }
    else{
      Get.back();
    }
  }
}