import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_structure/config/app_colors.dart';
class ConstData {
  static RxString accessToken = "".obs;
  static RxInt userId = 0.obs ;
  static RxString useName ="".obs;
  static RxString userEmail = "".obs;
  static RxString userImage= "".obs;

  static void showToastMessage({required String toastMessage}) {
    Fluttertoast.showToast(
      msg: toastMessage,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.kWhite,
      textColor:AppColors.kBlack,
    );
  }
  static Future<XFile?> getCameraImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image;
    image = await picker.pickImage(source: ImageSource.camera);
    if(image != null){
      return image;
    }else{
      return null;
    }
  }
  static Future<XFile?> getGalleryImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image;
    image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      return image;
    }else{
      return null;
    }
  }
}