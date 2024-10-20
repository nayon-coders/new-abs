import 'dart:convert';

import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AdminUpdateController extends GetxController{

  Rx<TextEditingController> oldPass = TextEditingController().obs;
  Rx<TextEditingController> newPass =TextEditingController().obs;
  Rx<TextEditingController> confirmPass =TextEditingController().obs;

  RxBool isUpdate = false.obs;




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


  //clear text Editing controller
  clearTextEditingController(){
    oldPass.value.clear();
    newPass.value.clear();
    confirmPass.value.clear();
  }

}