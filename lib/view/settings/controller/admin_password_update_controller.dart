import 'dart:convert';
import 'dart:io';
import 'package:abs_office_management/data/model/single_admin_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AdminUpdateController extends GetxController{

  //image section
  Rx<File?> selectedImage = Rx<File?>(null);
  final picker = ImagePicker();

  //admin password change text Editing controller
  Rx<TextEditingController> oldPass = TextEditingController().obs;
  Rx<TextEditingController> newPass =TextEditingController().obs;
  Rx<TextEditingController> confirmPass =TextEditingController().obs;

  //business setup TextEditing controller
  Rx<TextEditingController> businessName = TextEditingController().obs;
  Rx<TextEditingController> businessAddress = TextEditingController().obs;
  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;


  //Get Single User Model
  Rx<SingleAdminModel> singelmodel = SingleAdminModel().obs;

  //Rx bool
  RxBool isUpdate = false.obs;
  RxBool isLoading = false.obs;
  RxBool isGetting = false.obs;

  @override
  onInit(){
    super.onInit();
    getSingleAdmin();


  }



  //update  password
  adminChangePassword()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();

    isUpdate.value = true;
    final body ={
      "old_password":oldPass.value.text,
      "new_password":newPass.value.text
    };
    var id = _pref.getString("id");

    final res = await ApiServices.putApi(AppConfig.SINGLE_ADMIN_PASS_CHANGE+id!, body);

    print(jsonDecode(res.body));
    if(res.statusCode == 200){
      clearTextEditingController();
      Get.snackbar("Successful", "Update Successful",colorText: Colors.white,backgroundColor: Colors.green);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red,colorText: Colors.black);
      print(res.statusCode);
    }
    isUpdate.value = false;

  }



  //image select image
  pickImage(ImageSource source)async{
    final pickFile = await picker.pickImage(source: source,imageQuality: 80,preferredCameraDevice: CameraDevice.front);
    if(pickFile != null){
      selectedImage.value = File(pickFile.path);
      print("Selected Image Path: ${selectedImage.value?.path}");
      print("-----image selected successful");
      update();
    }else{
      print("No image selected");
    }
  }
  //business setup 
  adminBusinessSetup()async{
    isLoading.value = true;
   SharedPreferences _pref = await SharedPreferences.getInstance();
   String? token = _pref.getString("token");
   final  id = _pref.getString("id");
   final stream = http.ByteStream(selectedImage.value!.openRead());
   final length = await selectedImage.value!.length();
   getSingleAdmin();

   if(selectedImage != null){
     final request = http.MultipartRequest(
       "PUT",
       Uri.parse(AppConfig.SINGLE_ADMIN_INFO_UPDATE+id!),
     );
     request.headers["Authorization"] = "Bearer $token";
     request.headers["Content-Type"] = "multipart/form-data";
     final multipartFile = http.MultipartFile(
       "profilePic",
       stream,
       length,
       filename: selectedImage.value!.path.split("/").last,
     );
     final data ={
       "business_name":businessName.value.text,
       "business_address":businessAddress.value.text,
       "name":name.value.text,
       "phone":phone.value.text,
     };
     request.files.add(multipartFile);
     request.fields.addAll(data);
     final response = await request.send();

     final res = await http.Response.fromStream(response);
     if(res.statusCode == 200){
       Get.snackbar("Successful", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.green);
     }else{
       print("status code :${res.statusCode}");
       print("------body :${jsonDecode(res.body)}------");
       Get.snackbar("failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red,colorText: Colors.white);
     }

   }
    isLoading.value = false;
  }

  //Get Single Admin model
  getSingleAdmin()async{
    isGetting.value = true;
    final res = await ApiServices.getApi(AppConfig.SINGLE_ADMIN_INFO);
    if(res.statusCode == 200){
      singelmodel.value = singleAdminModelFromJson(res.body);
      businessName.value.text = singelmodel.value.businessName ?? "";
      businessAddress.value.text = singelmodel.value.businessAddress ?? "";
      name.value.text = singelmodel.value.name ?? "";
      phone.value.text = singelmodel.value.phone ?? "";
      print("Single Admin get success ");
    }else{
      print("Failed Single Admin get");
    }
    isGetting.value = false;



  }


  //clear text Editing controller
  clearTextEditingController(){
    oldPass.value.clear();
    newPass.value.clear();
    confirmPass.value.clear();
  }

}