import 'dart:convert';

import 'package:abs_office_management/data/services/api_services.dart';
import 'package:abs_office_management/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../../../app_config.dart';
import 'package:http/http.dart' as http;

import '../../../data/model/taxStateModel.dart';
import '../../../data/global_controller/global_controller.dart';


class TaxController extends GetxController{

  Rx<TextEditingController>  taxController = TextEditingController().obs;
   Rx<TextEditingController> stateController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getTaxStatus();
    getTaxAndState();
  }
  //on ready
  @override
  void onReady() {
    super.onReady();
    getTaxStatus();
    getTaxAndState();
  }
  //on close
  @override
  void onClose() {
    super.onClose();
  }

  //RX BOOL FOR LOADING
  RxBool isLoading = false.obs;
  RxBool isDeleting = false.obs;
  RxBool isUpdating = false.obs;

  RxBool isTaxStatus = false.obs;

  //rx model
   Rx<TaxStateModel> taxStateModel = TaxStateModel().obs;

  //update tax and state
  void updateTaxAndState()async{
    if(taxController.value.text.isEmpty){
      Get.snackbar("Please enter tax", "Tax is required", backgroundColor: Colors.red);
    }else if(stateController.value.text.isEmpty){
      Get.snackbar("Please enter state", "State is required", backgroundColor: Colors.red);
    }else{
      isUpdating.value = true;
      //API CALL
      var data = {
        "tax": taxController.value.text,
        "state": stateController.value.text
      };
      var response = await ApiServices.putApi(AppConfig.TAX_AND_STATE_UPDATE+taxStateModel.value.data!.id.toString(), data);
      if(response.statusCode == 201) {
        Get.snackbar("Success", "Tax and state updated successfully",
            backgroundColor: Colors.green);
        isUpdating.value = false;
        clearAll(); //clear all text field
        getTaxAndState(); //refresh data
      }else{
        Get.snackbar("Error", "Failed to update tax and state", backgroundColor: Colors.red);
        isUpdating.value = false;
      }
    }
  }

  //get tax and state
  void getTaxAndState()async{
    isLoading.value = true;
    var response = await ApiServices.getApi(AppConfig.TAX_AND_STATE);
    if(response.statusCode == 200){
      taxStateModel.value = taxStateModelFromJson(response.body);
      taxController.value.text = taxStateModel.value.data!.tax.toString();
      stateController.value.text = taxStateModel.value.data!.state.toString();
      //insert into global variable
      GlobalVariables.gTaxStateModel.value = taxStateModel.value;
      isLoading.value = false;

    }else{
      Get.snackbar("Error", "Failed to get tax and state", backgroundColor: Colors.red);
      //insert into global variable
      GlobalVariables.gTaxStateModel.value = taxStateModel.value;
      isLoading.value = false;

    }
  }

  //update tax status
  void updateTaxStatus()async{
    isUpdating.value = true;
    var response = await http.put(Uri.parse(AppConfig.TAX_STATUS_UPDATE+isTaxStatus.value.toString()),
        headers: {
          "Authorization": "Bearer ${sharedPreferences!.getString("token")}"
        }
    );
    if(response.statusCode == 200){
      Get.snackbar("Success", "Tax status updated successfully", backgroundColor: Colors.green);
      isUpdating.value = false;
      getTaxStatus(); //refresh data
      getTaxAndState(); //refresh data
    }else{
      Get.snackbar("Error", "Failed to update tax status", backgroundColor: Colors.red);
      isUpdating.value = false;
    }
  }

  //get tax status
  void getTaxStatus()async{
    var response = await ApiServices.getApi(AppConfig.TAX_STATUS_CHECK);
    if(response.statusCode == 200){
      isTaxStatus.value = bool.parse(jsonDecode(response.body)["result"]["status"]);
      //insert into global variable
      GlobalVariables.gIsTaxStatus.value = isTaxStatus.value;
    }else{
      isTaxStatus.value = false;
    }
  }



  //clear all text field
  void clearAll(){
    taxController.value.clear();
    stateController.value.clear();
  }


}