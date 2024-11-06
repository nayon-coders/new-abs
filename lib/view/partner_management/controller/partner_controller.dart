import 'dart:convert';
import 'dart:io';
import 'package:abs_office_management/data/model/partner_model/get_single_partner_model.dart';
import 'package:abs_office_management/main.dart';
import 'package:flutter/material.dart';
import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/model/partner_model/get_all_partner_model.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/route_name.dart';

class PartnerController extends GetxController{

  //TextEditing controller
  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> percent = TextEditingController().obs;

  //model
  Rx<GetAllPartnerModel> getAllPartnerModel = GetAllPartnerModel().obs;
  Rx<GetSinglePartnerModel> singlePartnerModel = GetSinglePartnerModel().obs;





  //RxBool
  RxBool isAdding = false.obs;
  RxBool isGetting = false.obs;
  RxBool isDelete = false.obs;
  RxBool isEditing = false.obs;
  RxBool isUpdateProfile = false.obs;

  RxString id = "".obs;

  @override
  onInit(){
    super.onInit();
    getPartner();

  }



  //create partner
  addPartner()async{
    isAdding.value = true;
    final data ={
      "name":name.value.text,
      "email":email.value.text,
      "password":password.value.text,
      "phone":phone.value.text,
      "percentage":percent.value.text,
    };
    final res = await ApiServices.postApi(AppConfig.CREATE_PARTNER, data);

    if(res.statusCode == 201){
      clearAllData();
      getPartner();
      Get.back();
      Get.snackbar("Successful", "${jsonDecode(res.body)["message"]}",backgroundColor:Colors.green,colorText: Colors.white);

    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}");
      print("Status code :${res.statusCode}");
    }
    isAdding.value = false;

  }

  //Get all Partner
  getPartner()async{
    isGetting.value = true;
    final res = await ApiServices.getApi(AppConfig.GET_ALL_PARTNER);
    print(res.body);
    if(res.statusCode ==200){
      print("Success ${jsonDecode(res.body)["message"]}");
      getAllPartnerModel.value = getAllPartnerModelFromJson(res.body);
    }else{
      print("Failed ${jsonDecode(res.body)["message"]}");
      print("Status code:${res.statusCode}");
    }
    isGetting.value = false;

  }

  //get Single partner info
  singlePartner(id)async{
    isGetting.value = true;
    final res = await ApiServices.getApi(AppConfig.GET_SINGLE_PARTNER+id.toString());
    if(res.statusCode == 200){
      update();
      print("Successful get single employee");
      singlePartnerModel.value = getSinglePartnerModelFromJson(res.body);
    }else{
      print("Failed ${jsonDecode(res.body)["message"]}");
      print(res.statusCode);
    }
    isGetting.value = false;
  }

  //update partneR PROFILE
  Future updatePartnerProfile(id, File image) async {
    isUpdateProfile.value = true;
    final headers =  {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
    };

    final res = http.MultipartRequest(
        'PUT',
        Uri.parse(AppConfig.PARTNER_PROFILE_UPDATE + id)
    );
    res.headers.addAll(headers);
    res.files.add(await http.MultipartFile.fromPath('profilePic', image.path));

    final response = await res.send();
    print("Response : ${response.statusCode}");

    if (response.statusCode == 201) {
      print("Successful update partner profile");
      singlePartner(id); // get single Partner id
      getPartner();

      Get.back();
      Get.snackbar("Successful", "Profile has been updated!", backgroundColor: Colors.green,colorText: Colors.white);
    } else {
      final responseBody = await response.stream.bytesToString();
      print("Failed ${jsonDecode(responseBody)}");
      print(response.statusCode);
    }

    isUpdateProfile.value = false;
  }


  //delete partner
  deletePartner(id)async{
    isDelete.value = true;
    final res = await ApiServices.deleteApi(AppConfig.DELETE_PARTNER+id);
    if(res.statusCode == 200){
      getPartner();
      Get.offAllNamed(AppRoute.partnerManagementScreen);
      Get.snackbar("Successful", "Delete Successful",backgroundColor: Colors.green,colorText: Colors.white);

    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red);
    }
    isDelete.value = false;
    }

    //Edit Partner
  editPartner(data)async{
    isAdding.value = true;
    final body={
      "name":name.value.text,
      "email":email.value.text,
      "password":password.value.text,
      "phone":phone.value.text,
      "percentage":percent.value.text,
    };
    final res = await ApiServices.putApi(AppConfig.EDIT_PARTNER+id.value, body);
    if(res.statusCode ==201){
      singlePartner(id.value);
      getPartner();
      clearAllData();
      Get.back();
      Get.snackbar("Successful", "Partner Edit successful",backgroundColor: Colors.green,colorText: Colors.white);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red);
    }
    isAdding.value = false;

  }

  editValueSave(data){
    id.value = data.id.toString();
    isEditing.value = true;
    name.value.text = data.name ?? "";
    email.value.text = data.email ?? "";
    phone.value.text = data.phone ??"";
    percent.value.text = data.percentage.toString() ??"";

    print("------name:${name.value.text}");
  }


  //close textEditing controller
  clearAllData()async{
    name.value.clear();
    email.value.clear();
    phone.value.clear();
    password.value.clear();
    percent.value.clear();

  }


}