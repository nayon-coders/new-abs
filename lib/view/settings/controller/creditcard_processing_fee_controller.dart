import 'dart:convert';

import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../data/model/credit_card_fee_model.dart';

class CreditcardProcessingFeeController extends GetxController{

  //Rx textEditing Controller
  Rx<TextEditingController> creditCardFee = TextEditingController().obs;
  Rx<CredicardFeeModel> creditModel = CredicardFeeModel().obs;


  @override
  onInit(){
    super.onInit();
    getCreditCardFee();


  }

  //Rx bool
  RxBool isAdding = false.obs;
  RxBool isGetting = false.obs;
  RxBool isUpdating = false.obs;
  RxBool isDeleting = false.obs;

  //add employee
  addCreditCardFee()async{
    isUpdating.value = true;
    var body ={
      "fee":creditCardFee.value.text
    };
    final res =await ApiServices.putApi(AppConfig.UPDATE_CREDIT_CARD_PROCESSING,body);


    if(res.statusCode == 200){
      clearTextEditingController();
      getCreditCardFee();

      Get.snackbar("Successful", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.green,colorText: Colors.white);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red,colorText: Colors.white);
    }
    isAdding.value= false;

  }

  //get credit-card fee

  getCreditCardFee()async{
    isGetting.value = true;
    final res = await ApiServices.getApi(AppConfig.GET_CREDIT_CARD_PROCESSING);

    if(res.statusCode == 200){
      creditModel.value = credicardFeeModelFromJson(res.body);
      print("successful:${jsonDecode(res.body)["message"]}");
      isGetting.value = false;
    }
    print("failed:${jsonDecode(res.body)["message"]}");
  }







  //clear TextEditing controller
  clearTextEditingController(){
    creditCardFee.value.clear();
  }
}