import 'dart:convert';

import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/date_time_controller.dart';
import '../../../data/model/food_cost_model.dart';
import '../../../routes/route_name.dart';
class FoodCostController extends GetxController {

  final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  void onInit() {
    super.onInit();
    vendorName.add(TextEditingController());
    vendorAmount.add(TextEditingController());
    chequeNumber.add(TextEditingController());
    payList.add("online");

    getAllFoodCost(dateTimeController.month, dateTimeController.year);
  }

  RxString selectedPlatform = "Food Cost".obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> selectedDate = TextEditingController().obs;
  RxList<TextEditingController> vendorName = <TextEditingController>[].obs;
  RxList<TextEditingController> vendorAmount = <TextEditingController>[].obs;
  RxList<TextEditingController> chequeNumber = <TextEditingController>[].obs;
  RxList payList = [].obs;
  RxString selectedId = "".obs;
  final List vendorInfoList = [];

  Rx<FoodCostModel> foodCostModel = FoodCostModel().obs;
  RxBool isLoading = false.obs;
  RxBool isForEdit = false.obs;
  RxBool isEditing = false.obs;
  RxBool isAdding = false.obs;
  RxBool isDeleting = false.obs;
  RxBool isUpdating = false.obs;

  //get all food cost
  Future<void> getAllFoodCost(month, year) async {
    isLoading.value = true;
    final response = await ApiServices.getApi(AppConfig.FOOD_COST+"?month=$month&year=$year"); //ApiServices.getApi(AppConfig.FOOD_COST);
    if (response.statusCode == 200) {
      foodCostModel.value = FoodCostModel.fromJson(jsonDecode(response.body));
    }
    isLoading.value = false;
  }

  //add food cost
  Future<void> addFoodCost() async {
    vendorInfoList.clear();
    isAdding.value = true;
    for(var i in vendorName){
      vendorInfoList.add({
        "vendor_name": i.text,
        "vendor_amount": vendorAmount[vendorName.indexOf(i)].text,
        "pay_by" : payList[vendorName.indexOf(i)],
        "checkNo": chequeNumber[vendorName.indexOf(i)].text
      });
    }

    var data = {
      "name": selectedPlatform.value,
      "data": vendorInfoList,
      "date": dateController.value.text
    };
    final response = await ApiServices.postApi(AppConfig.FOOD_COST_CREATE, data);
    if (response.statusCode == 201) {
      clearAllData(); //clear all data
      isAdding.value = false;
      getAllFoodCost(dateTimeController.month, dateTimeController.year);
      Get.back();
      Get.snackbar("Success", "Food Cost Added Successfully", backgroundColor: Colors.green);

    }else{
      isAdding.value = false;
      Get.snackbar("Error", "Something went wrong: Status Code: ${response.statusCode}", backgroundColor: Colors.red);
    }
  }

  //update food cost
  Future<void> updateFoodCost() async {
    vendorInfoList.clear();
    isAdding.value = true;
    for(var i in vendorName){
      vendorInfoList.add({
        "vendor_name": i.text,
        "vendor_amount": vendorAmount[vendorName.indexOf(i)].text,
        "pay_by" : payList[vendorName.indexOf(i)],
        "checkNo": chequeNumber[vendorName.indexOf(i)].text
      });
    }

    var data = {
      "name": selectedPlatform.value,
      "data": vendorInfoList,
      "date": dateController.value.text
    };
    print("data: $data");
    final response = await ApiServices.putApi(AppConfig.FOOD_COST_UPDATE+selectedId.value, data);
    if (response.statusCode == 200) {
      clearAllData(); //clear all data
      isAdding.value = false;
      getAllFoodCost(dateTimeController.month, dateTimeController.year);
      Get.back(); //back to previous page
      Get.snackbar("Success", "Food Cost Updated Successfully", backgroundColor: Colors.green);

    }else{
      isAdding.value = false;
      Get.snackbar("Error", "Something went wrong: Status Code: ${response.statusCode}", backgroundColor: Colors.red);
    }
  }

  //delete food cost
  Future<void> deleteFoodCost(String id) async {
    isDeleting.value = true;
    final response = await ApiServices.deleteApi(AppConfig.FOOD_COST_DELETE+id);
    if (response.statusCode == 200) {
      isDeleting.value = false;
      Get.back();
      Get.snackbar("Success", "Food Cost Deleted Successfully", backgroundColor: Colors.green);

      getAllFoodCost(dateTimeController.month, dateTimeController.year);


    }else{
      isDeleting.value = false;
      Get.snackbar("Error", "Something went wrong: Status Code: ${response.statusCode}", backgroundColor: Colors.red);
    }
  }


  //sset edit data
  void setEditData(FoodCostResult data){
    vendorName.clear();
    vendorAmount.clear();
    chequeNumber.clear();
    payList.clear();


    isForEdit.value = true;
    selectedDate.value.text = dateTimeController.dateFormat1(DateTime.parse(data.date.toString()));
    selectedId.value = data.id.toString();
    dateController.value.text = data.date.toString();

    for(var i in data.data!){
      vendorName.add(TextEditingController(text: i.vendorName));
      vendorAmount.add(TextEditingController(text: i.vendorAmount.toString()));
      chequeNumber.add(TextEditingController(text: i.checkNo));
      payList.add(i.payBy);
    }
    update();
    Get.toNamed(AppRoute.addFoodCost);
  }

  //vendor name add
  void addVendorName() {
    vendorName.add(TextEditingController());
    vendorAmount.add(TextEditingController());
    chequeNumber.add(TextEditingController());
    update();
  }
  // vendor name remove
  void removeVendorName(int index) {
    vendorName.removeAt(index);
    chequeNumber.removeAt(index);
    vendorAmount.removeAt(index);
    payList.remove(index);
    update();
  }

  //clear all data
  void clearAllData(){
    isEditing.value = false;
    isForEdit.value = false;
    selectedId.value = "";
    selectedDate.value.text = "";
    dateController.value.text = "";
    isForEdit.value = false;
    isAdding.value = false;
    isEditing.value = false;
    isDeleting.value = false;
    isUpdating.value = false;
    vendorName.clear();
    vendorAmount.clear();
    chequeNumber.clear();
    payList.clear();



    update();
  }




}