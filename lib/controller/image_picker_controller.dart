import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxBool isShow = false.obs;

  void toggleTab(bool value) {
    isShow.value = value;
  }

  Rx<File?> selectedImage = Rx<File?>(null);
  RxBool isLoading = false.obs;
  pickImage(ImageSource source)async{
    selectedImage.value = null; // Reset the selected image
    isLoading.value = true;
    final picFile = await ImagePicker().pickImage(source: source,imageQuality: 80,preferredCameraDevice: CameraDevice.front);
    if(picFile != null){
      selectedImage.value = File(picFile.path);
      print("--image path : ${selectedImage.value!.path}");
      print("image selected successful");

    }else{
      print("Image selected failed");
    }
    isLoading.value = false;

  }

}