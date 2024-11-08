import 'dart:convert';
import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/controller/date_time_controller.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

import '../../../data/model/all_sales_molde.dart';
import '../../../data/model/online.platform.model.dart';
class SalesController extends GetxController {
  DateTimeController dateTimeController = Get.put(DateTimeController());

  RxBool isOpenAdditionalBox = false.obs;
  RxBool isLoading = false.obs;
  RxBool isEdit = false.obs;
  RxBool isAdd = false.obs;
  RxBool isDelete = false.obs;
  RxBool isView = false.obs;

  Rx<AllSalesModel> allSalesList = AllSalesModel().obs;

  Rx<TextEditingController> grossSales = TextEditingController().obs;
  Rx<TextEditingController> creditSales = TextEditingController().obs;
  Rx<TextEditingController> totalCashCollect = TextEditingController().obs;
  Rx<TextEditingController> taxEditingController = TextEditingController().obs;
  RxList<OnlinePlatforms> platformNameList = <OnlinePlatforms>[].obs;
  RxList<TextEditingController> amountList = <TextEditingController>[].obs;
  RxDouble shortOver = 0.00.obs;
  Rx<TextEditingController> dateTime = TextEditingController().obs;
  Rx<TextEditingController> additionalIncome = TextEditingController().obs;
  RxString dateTimeDatabase = "".obs;
  List<Map<String, dynamic>> onlineSalesData = [];

  RxDouble totalTaxAmount = 0.0.obs;
  RxDouble netSales = 0.0.obs;
  RxDouble totalOnlineSales = 0.0.obs;
  RxDouble extraIncome = 0.0.obs;
  RxString selectedId = "".obs;



  @override
  void onInit() {
    super.onInit();
    getSales(dateTimeController.month, dateTimeController.year);
  }

  @override
  void onClose() {
    super.onClose();
    clearData();
  }


  //get all sales data
  void getSales(month, year) async {
    isLoading.value = true;
    var res = await ApiServices.getApi(AppConfig.TODAY_SALES+"?month=$month&year=$year");
    if(res.statusCode == 200){
      allSalesList.value = AllSalesModel.fromJson(jsonDecode(res.body));
    }
    isLoading.value = false;
  }


  //calculate the tax amount
  calculateAmount(SingleSalesDatum model)async{
     totalOnlineSales.value = double.parse("${model.onlineSales!.map((e)=> double.parse(e.amount!.toString())).reduce((a,b)=> a+b)}");
      extraIncome.value = double.parse("${model.additionalIncome}");
      if(double.parse(model.soOv!.toString()) > 0){
        netSales.value = (double.parse(model.salesRegister!) + totalOnlineSales.value) + double.parse(model.soOv!.toString()).abs();
      }else{
        netSales.value = (double.parse(model.salesRegister!) + totalOnlineSales.value) - double.parse(model.soOv!.toString()).abs();
      }
  }

  //clear calculate data
  clearCalculateData(){
    totalOnlineSales.value = 0.0;
    extraIncome.value = 0.0;
    netSales.value = 0.0;
  }



  //add sales data
  void addSales() async {
    onlineSalesData.clear();
    isAdd.value = true;
    //online sales data
    for(int i=0; i<platformNameList.length; i++){
      onlineSalesData.add({
        "name": platformNameList[i].name,
        "amount": amountList[i].text.isEmpty ? "0.00": amountList[i].text
      });
    }

    if(taxEditingController.value.text.isEmpty){
      totalTaxAmount.value = calculateTax(double.parse(grossSales.value.text), double.parse(taxEditingController.value.text));
    }else{
      totalTaxAmount.value = double.parse(taxEditingController.value.text);
    }

    var data = {
      "salesRegister": grossSales.value.text,
      "totalCashCollect": totalCashCollect.value.text,
      "craditeSales": creditSales.value.text,
      "so_ov": shortOver.value.toStringAsFixed(2),
      "tax" : totalTaxAmount.value.toStringAsFixed(2),
      "additional_income": additionalIncome.value.text.isEmpty ? 0.00 : additionalIncome.value.text,
      "onlineSales": onlineSalesData,
      "date": dateTimeDatabase.value
    };
    print("data --- ${data}");
    var res = await ApiServices.postApi(AppConfig.TODAY_SALES_CREATE, data);
    if(res.statusCode == 201){
      clearData(); //clear all data
      getSales(dateTimeController.month, dateTimeController.year);
      Get.back(); // close the dialog

      Get.snackbar("Success!", "Data added successfully", backgroundColor: Colors.green, colorText: Colors.white);
    }
    isAdd.value = false;
  }

  //edit sales data
  void editSales() async {
    isAdd.value = true;

    if(totalTaxAmount.value == 0.0){
      totalTaxAmount.value = calculateTax(double.parse(grossSales.value.text), double.parse(taxEditingController.value.text));
    }
    var data = {
      "salesRegister": grossSales.value.text,
      "totalCashCollect": totalCashCollect.value.text,
      "craditeSales": creditSales.value.text,
      "so_ov": shortOver.value.toStringAsFixed(2),
      "tax" : totalTaxAmount.value.toStringAsFixed(2), //tax amount
      "additional_income": additionalIncome.value.text.isEmpty ? 0.00 : additionalIncome.value.text,
      "onlineSales": onlineSalesData,
      "date": dateTimeDatabase.value
    };
    var res = await ApiServices.putApi(AppConfig.TODAY_SALES_UPDATE+"${selectedId.value}", data);
    if(res.statusCode == 200){
      clearData(); //clear all data
      getSales(dateTimeController.month, dateTimeController.year);
      Get.back();
      Get.snackbar("Success!", "Data updated successfully", backgroundColor: Colors.green, colorText: Colors.white);
    }else{
      Get.snackbar("Error!", "Data not updated: Status Code: ${res.statusCode}", backgroundColor: Colors.red, colorText: Colors.white);
    }
    isAdd.value = false;
  }

  //delete sales data
  void deleteSales(id) async {
    isDelete.value = true;
    var res = await ApiServices.deleteApi(AppConfig.TODAY_SALES_DELETE+"${id}");
    if(res.statusCode == 200){
      clearData();
      //allSalesList.removeWhere((element) => element.id == 1);
      getSales(dateTimeController.month, dateTimeController.year);
      Get.snackbar("Success!", "Data deleted successfully", backgroundColor: Colors.green, colorText: Colors.white);
    }else{
      Get.snackbar("Error!", "Data not deleted", backgroundColor: Colors.red, colorText: Colors.white);
    }
    isDelete.value = false;
  }

  //edit values in Map
  //set data for edit
  void setDataForEdit(SingleSalesDatum data){
    onlineSalesData.clear();
    isEdit.value = true;
    additionalIncome.value.text = data.additionalIncome.toString();
    selectedId.value = data.id.toString();
    grossSales.value.text = data.salesRegister.toString();
    creditSales.value.text = data.craditeSales.toString();
    totalCashCollect.value.text = data.totalCashCollect.toString();
    shortOver.value = double.parse(data.soOv.toString());
    dateTime.value.text = dateTimeController.dateFormat1(data.date!);
    dateTimeDatabase.value = data.date.toString();
    totalTaxAmount.value = data.tax!.toDouble();
    //set online sales data
    for(int i=0; i<data.onlineSales!.length; i++){
   //   platformNameList.value.add(OnlinePlatforms(name: data.onlineSales![i].name!.name));
      amountList.value.add(TextEditingController());
      amountList.value[i].text = data.onlineSales![i].amount.toString();
      onlineSalesData.add({ //add online sales data
        "name": data.onlineSales![i].name ?? "No Name. Edit Now",
        "amount": data.onlineSales![i].amount
      });

    }
  }


  //calculate credit sales and total cash collect = short over
  void calculateCreditSalesAndTotalCashCollect(){
    print("creditSalesAmount + totalCashCollectAmountt--- ${creditSales.value.text} + ${totalCashCollect.value.text}");
    double creditSalesAmount = creditSales.value.text.isEmpty ? 0.0 : double.parse(creditSales.value.text);
    double totalCashCollectAmount = totalCashCollect.value.text.isEmpty ? 0.0 : double.parse(totalCashCollect.value.text);
    double totalRegisterSale = grossSales.value.text.isEmpty ? 0.0 : double.parse(grossSales.value.text);
    double shortOverAmount = ((creditSalesAmount + totalCashCollectAmount) - totalRegisterSale );
    shortOver.value = shortOverAmount;
    update();  //update the UI
  }


  //clear all data
  void clearData(){
    isEdit.value = false;
    isAdd.value = false;
    selectedId.value = "";
    grossSales.value.clear();
    creditSales.value.clear();
    totalCashCollect.value.clear();
    shortOver.value = 0.00;
    dateTime.value.clear();
    platformNameList.clear();
    amountList.clear();
    totalTaxAmount.value = 0.0;
    additionalIncome.value.clear();
    taxEditingController.value.clear();

  }




  //calculate tax
   calculateTax(double amount, double tax){
    var taxAmount = 0.0;
    if(tax != null){ //if tax is not null
      taxAmount = (amount * tax)/100;
    }
    totalTaxAmount.value = taxAmount;
    print("amount -- ${amount}");// return tax amount
    print("tax -- ${tax}");// return tax amount
    print("taxAmount -- ${totalTaxAmount.value}");// return tax amount
  }


  //refresh data
  Future<void> onRefresh()async {
    getSales(dateTimeController.month, dateTimeController.year);
  }

}