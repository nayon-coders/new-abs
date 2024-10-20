import 'dart:convert';

import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/model/employee_position_model.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeePositionController extends GetxController{

  //oninit
  @override
  void onInit() {
    super.onInit();
    getEmployeePosition();
  }

  //onReady
  @override
  void onReady() {
    super.onReady();
    getEmployeePosition();
  }

  //onClose
  @override
  void onClose() {
    super.onClose();
  }


  //Rx textEditing Controller
  Rx<TextEditingController> positionName = TextEditingController().obs;

  //Get Position model
  Rx<EmployeePositionModel> positionModel = EmployeePositionModel().obs;

  //Rx bool
  RxBool isAdding = false.obs;
  RxBool isGetting = false.obs;
  RxBool isUpdating = false.obs;
  RxBool isDeleting = false.obs;

  //add employee
  addEmployeePosition()async{
      var data ={
        "name":positionName.value.text,
      };
      final res = await ApiServices.postApi(AppConfig.CREATE_POSITION, data,);
      isAdding.value = false;
      if(res.statusCode ==201){
        clearTextEditingController();
        getEmployeePosition();
        Get.snackbar("Successful", "Employee Position add Successful",colorText: Colors.white,backgroundColor: Colors.green);

      }else{
        Get.snackbar("Failed", "Employee Position add Failed",colorText: Colors.black,backgroundColor: Colors.red);
        print("failed : ${jsonDecode(res.body)["message"]}");

      }

  }


  //getEmployeePosition
  getEmployeePosition()async{
      isGetting.value = true;
      final res= await ApiServices.getApi(AppConfig.GET_POSITION);
      isGetting.value = false;

      if(res.statusCode == 200){
        positionModel.value = employeePositionModelFromJson(res.body);
        print("Employee position get Successful");
      }else{
        print("position Get Failed : ${jsonDecode(res.body)["message"]}");
      }

  }
  
  
  //update employee position
  
  updatePosition(data)async{

      isUpdating.value = true;
      final res = await ApiServices.putApi(AppConfig.UPDATE_POSITION, data);
      isUpdating.value = false;
      if(res.statusCode ==200){
        Get.snackbar("Successful", "Position Update Successful",backgroundColor: Colors.green,colorText: Colors.white);
        Get.back();
      }else{
        Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red,colorText: Colors.black);
      }
    
  }


  //Delete Position
  deletePosition(id)async{
      isDeleting.value = true;
      final res =await ApiServices.deleteApi(AppConfig.DELETE_POSITION+id);

      print(jsonDecode(res.body));
      if(res.statusCode == 200){
        //Get.snackbar("Successful", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red,colorText: Colors.black);
        getEmployeePosition();

      }else{
        print("Delete failed :${jsonDecode(res.body)["message"]}");

      }
      isDeleting.value = false;


  }




  //clear TextEditing controller
  clearTextEditingController(){
    positionName.value.clear();
  }
}