import 'dart:convert';

import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/model/all_cost_list_model.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/date_time_controller.dart';
import '../../../data/model/costing_list_model.dart';
class CostController extends GetxController{

  //Date time controller
  final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  void onInit() {
    super.onInit();
    getAllCostList(dateTimeController.month, dateTimeController.year);
    getCostList();
  }

  @override
  void onReady(){
    super.onReady();
    getAllCostList(dateTimeController.month, dateTimeController.year);
    getCostList();
  }

  RxBool isCostListGetting = false.obs;
  RxBool isGetting = false.obs;
  RxBool isAddCost = false.obs;
  RxBool isManageCost = false.obs;
  RxBool isCosting = false.obs;
  RxBool isCostListDelete = false.obs;
  RxBool isCostListAdding = false.obs;
  RxBool isEditCostListName = false.obs;
  RxBool isEditCosting = false.obs;

  //Text input controller
   Rx<TextEditingController> costNameController = TextEditingController().obs;
   Rx<TextEditingController> costAmount = TextEditingController().obs;
   Rx<TextEditingController> selectedDate = TextEditingController().obs;
   RxString costPlatform = "".obs;
    RxString costDate = "".obs;
    RxString selectedCostId = "".obs;

  Rx<ConstingListModel> costingListModel = ConstingListModel().obs;
  Rx<AllCostListModel> allCostList = AllCostListModel().obs;
  Rx<SingleCostingModel> singleCostingModel = SingleCostingModel().obs;

  //get cost list
  void getCostList() async {
    isCostListGetting.value = true;
    var res = await ApiServices.getApi(AppConfig.COST_LIST);
    if(res.statusCode == 200){
      costingListModel.value = ConstingListModel.fromJson(jsonDecode(res.body));
     // allCostList.refresh();
    }
    isCostListGetting.value = false;
  }

  //add costing list
  void addCostingList() async {
    isCostListAdding.value = true;
    var res = await ApiServices.postApi(AppConfig.COST_CREATE, {
      "name": costNameController.value.text
    });
    if(res.statusCode == 200){
      clearAll();
      getCostList();
      Get.snackbar("Success!", "Costing list added successfully", backgroundColor: Colors.green, colorText: Colors.white);
    }
    isCostListAdding.value = false;
  }
  //delete costing list
  void deleteCostListName(String id) async {
    isCostListDelete.value = true;

    var res = await ApiServices.deleteApi(AppConfig.COST_DELETE + id);

    if(res.statusCode == 200){
      Get.back();
      getCostList();
      Get.snackbar("Success!", "Costing list deleted successfully", backgroundColor: Colors.green, colorText: Colors.white);
    }
    isCostListDelete.value = false;
  }

  //create cost
  void createCost() async {
    var data = {
      "costings": [
        { "costName": costPlatform.value, "amount": costAmount.value.text }
      ],
      "date": costDate.value
    };
    isAddCost.value = true;
    var res = await ApiServices.postApi(AppConfig.COSTING_CREATE, data);
    if(res.statusCode == 200){
      clearAll();
      getAllCostList(dateTimeController.month, dateTimeController.year);
      Get.back();
      Get.snackbar("Success!", "Cost added successfully", backgroundColor: Colors.green, colorText: Colors.white);
    }
    isAddCost.value = false;
  }
  //get all cost
  void getAllCostList(month, year) async {
    isGetting.value = true;
    var res = await ApiServices.getApi(AppConfig.COSTING+"?month=$month&year=$year");
    if(res.statusCode == 200){
      allCostList.value = AllCostListModel.fromJson(jsonDecode(res.body));
    }
    isGetting.value = false;
  }

  //edit cost
  void editCost() async {
    var data ={
      "costName": costPlatform.value,
      "amount": costAmount.value.text,
      "date": costDate.value
    }; //{"costName":"Internet Bill","amount":300,"date":"2024-07-17"}
    print("data --- ${data}");
    isAddCost.value = true;
    var res = await ApiServices.putApi(AppConfig.COSTING_UPDATE+selectedCostId.value, data);
    if(res.statusCode == 200){
      clearAll();
      getAllCostList(dateTimeController.month, dateTimeController.year);
      Get.back();
      Get.snackbar("Success!", "Cost updated successfully", backgroundColor: Colors.green, colorText: Colors.white);
    }
    isAddCost.value = false;
  }

  //delete costing list
  void deleteCostingList(String id) async {
    isCostListDelete.value = true;

    var res = await ApiServices.deleteApi(AppConfig.COSTING_DELETE + id);

    if(res.statusCode == 200){
      Get.back();
      getAllCostList(dateTimeController.month, dateTimeController.year);
      Get.snackbar("Success!", "Costing list deleted successfully", backgroundColor: Colors.green, colorText: Colors.white);
    }
    isCostListDelete.value = false;
  }




  //set data for edit costing list
  void setDataForEditCostingList(SingleCostingModel data){
    isEditCosting.value = true;
    costPlatform.value = data.costName!;
    selectedCostId.value = data.id.toString();
    costAmount.value.text = data.amount!;
    costDate.value = dateTimeController.dateFormatDatabase(DateTime.parse(data.date.toString()));
    selectedDate.value.text = dateTimeController.dateFormat1(DateTime.parse(data.date.toString()));

  }
  //clear text controller
  clearAll(){
    isEditCostListName.value = false;
    isEditCosting.value = false;
    isCostListDelete.value = false;
    isCostListAdding.value = false;
    isAddCost.value = false;
    isCostListGetting.value = false;
    isGetting.value = false;
    isManageCost.value = false;
    isCosting.value = false;
    costNameController.value.clear();
    costAmount.value.clear();
    costDate.value = "";
    costPlatform.value = "";
    selectedDate.value.clear();
  }



}