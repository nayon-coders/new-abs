import 'dart:convert';

import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../data/model/salary_list_model.dart';

class SalaryManagementController extends GetxController{
  var totalAmount = 0.0.obs;

  //all salary get model
  Rx<SalaryListModel> salaryModel = SalaryListModel().obs;

  //textEditing controller
  Rx<TextEditingController> employeeName = TextEditingController().obs;
  Rx<TextEditingController> paymentItem = TextEditingController().obs;
  Rx<TextEditingController> amount = TextEditingController().obs;
  Rx<TextEditingController> selectDate = TextEditingController().obs;

  //RxBool
  RxBool isGetting = false.obs;
  RxBool isAdding = false.obs;


  //add salary
  addSalary(body)async{
    isAdding.value = true;
    Map<String, dynamic> body = {
      "employeeID": employeeName.value.text,
      "payBy": paymentItem.value.text,
      "amount": amount.value.text,
      "date": selectDate.value.text,
    };
    final res = await ApiServices.postApi(AppConfig.ALL_SALARY_LIST, body);
    if(res.statusCode == 200){
      Get.snackbar("Successful", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.green);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red);
      print(jsonDecode(res.body));
      print("Status code --${res.statusCode}");
    }
    isAdding.value = false;
  }

  //get salary list
  getAllSalary(month, year)async{
    isGetting.value = true;
    var res = await ApiServices.getApi("${AppConfig.ALL_SALARY_LIST}?month=$month&year=$year");
    if(res.statusCode == 200){
      print("success:${jsonDecode(res.body)["message"]}");
       SalaryListModel.fromJson(jsonDecode(res.body));

    }else{
      print("Failed ${jsonDecode(res.body)["message"]}");
    }
    isGetting.value = false;
  }
}