import 'dart:convert';

import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:abs_office_management/data/model/employee_model/get_all_employee_model.dart';
import 'package:abs_office_management/data/model/employee_model/single_empolyee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/route_name.dart';

class EmployeeManageController extends GetxController{
  //TextEditing controller
  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> pass = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
  Rx<TextEditingController> type = TextEditingController().obs;
  Rx<TextEditingController> employeeType = TextEditingController().obs;
  Rx<TextEditingController> employeePosition = TextEditingController().obs;
  Rx<TextEditingController> salaryType = TextEditingController().obs;
  Rx<TextEditingController> salaryRate = TextEditingController().obs;

  //Employee Models
  Rx<EmployeeListModel> employeeListModel = EmployeeListModel().obs;
  Rx<SingleEmployeeModel> singleModel = SingleEmployeeModel().obs;

  //Rx bool
  RxBool isGetting = false.obs;
  RxBool isLoading = false.obs;

  @override
  onInit(){
    super.onInit();
    allEmployeeList();

  }


  //Create Employee
  addEmployee()async{
    isLoading.value = true;
    var body ={
      "name": name.value.text,
      "email": email.value.text,
      "password": pass.value.text,
      "phone": phone.value.text,
      "type": type.value.text,
      "employeeType" : employeeType.value.text,
      "employeePosition" : employeePosition.value.text,
      "salaryType": salaryType.value.text,
      "salaryRate": salaryRate.value.text,
    };
    final res = await ApiServices.patchApi(AppConfig.CREATE_EMPLOYEE, body);
    if(res.statusCode ==200){
      clearTextEditingController();
      Get.snackbar("Successful", "${jsonDecode(res.body)["message"]}",colorText: Colors.white,backgroundColor: Colors.green);
      Get.offNamed(AppRoute.employeeManageScree);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }



  //get All Employee

  allEmployeeList()async{
    isGetting.value = true;
    final res = await ApiServices.getApi(AppConfig.ALL_EMPLOYEE);

    if(res.statusCode == 200){
      print("Employee get Success");
      employeeListModel.value =employeeListModelFromJson(res.body);
    }else{
      print("failed:${jsonDecode(res.body)["message"]}");
    }
    isGetting.value = false;

  }



  //single Employee
  getSingleEmployee(id)async{
    isGetting.value = true;
    final res = await ApiServices.getApi(AppConfig.SINGLE_EMPLOYEE+id);
    if(res.statusCode ==200){
      singleModel.value = singleEmployeeModelFromJson(res.body);
      print("Single Employee get successful");
    }else{
      print("Failed :${jsonDecode(res.body)}");
    }
    isGetting.value = false;

  }


  clearTextEditingController(){
    name.value.clear();
    email.value.clear();
    phone.value.clear();
    type.value.clear();
    employeePosition.value.clear();
    employeeType.value.clear();
    salaryRate.value.clear();
    salaryType.value.clear();
    pass.value.clear();

  }
}