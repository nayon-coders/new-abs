import 'dart:convert';
import 'package:abs_office_management/data/model/partner_model/get_single_partner_model.dart';
import 'package:flutter/material.dart';
import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/model/partner_model/get_all_partner_model.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
      Get.snackbar("Successful", "${jsonDecode(res.body)["message"]}",backgroundColor:Colors.green);

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
    final res = await ApiServices.getApi(AppConfig.GET_SINGLE_PARTNER+id);
    if(res.statusCode == 200){
      print("Successful get single employee");
      singlePartnerModel.value = getSinglePartnerModelFromJson(res.body);
    }else{
      print("Failed ${jsonDecode(res.body)["message"]}");
      print(res.statusCode);
    }
    isGetting.value = false;
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