import 'dart:convert';
import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/controller/date_time_controller.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:abs_office_management/view/employee_management/controller/employee_manage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../data/model/employee_model/get_all_employee_model.dart';
import '../../../data/model/salary_list_model.dart';
import '../../../routes/route_name.dart';

class SalaryManagementController extends GetxController{
  final EmployeeManageController employeeManageController = Get.put(EmployeeManageController());
  final DateTimeController dateTimeController = Get.put(DateTimeController());
  var totalAmount = 0.0.obs;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void onInit() {
    super.dispose();
    getAllSalary(dateTimeController.month, dateTimeController.year);
    selectedPayMethod.value = "Cash";

  }

  //all employe
  RxList<SingleEmployee> employeeList = <SingleEmployee>[].obs;
  RxList<SalaryItem> salaryList = <SalaryItem>[].obs;
  Rx<SingleEmployee> selectedEmployee = SingleEmployee().obs;

  //all salary get model
  Rx<SalaryListModel> salaryModel = SalaryListModel().obs;
  RxString selectedPayMethod = "".obs;

  //textEditing controller
  Rx<TextEditingController> checkNo = TextEditingController().obs;
  Rx<TextEditingController> amount = TextEditingController().obs;
  Rx<TextEditingController> selectDateDatabase = TextEditingController().obs;
  Rx<TextEditingController> selectDateShow = TextEditingController().obs;

  //RxBool
  RxBool isGetting = false.obs;
  RxBool isAdding = false.obs;
  RxBool isForEdit = false.obs;

  getAllEmoployeeList()async{
    await employeeManageController.allEmployeeList();
    employeeList.value = employeeManageController.employeeListModel.value.data!;
    selectedEmployee.value = employeeManageController.employeeListModel.value.data!.first;
  }

  //add salary
  addSalary()async{

    isAdding.value = true;
    Map<String, dynamic> body = {
      "employeeID": selectedEmployee.value.id.toString(),
      "payBy": selectedPayMethod.value,
      "check_no" : checkNo.value.text,
      "amount": amount.value.text,
      "date": selectDateDatabase.value.text,
    };
    final res = await ApiServices.postApi(AppConfig.CREATE_PAID_SALARY, body);
    if(res.statusCode == 200){
      clearAllData();
      getAllSalary(dateTimeController.month, dateTimeController.year);

      Get.back();
      Get.snackbar("Successful", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.green,colorText: Colors.white);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red);
      print(jsonDecode(res.body));
      print("Status code --${res.statusCode}");
    }
    isAdding.value = false;
  }

  //get salary list
  getAllSalary(month, year)async{
    salaryList.clear();
    isGetting.value = true;
    var res = await ApiServices.getApi("${AppConfig.ALL_SALARY_LIST}?month=$month&year=$year");
    if(res.statusCode == 200){
      salaryList.value =   SalaryListModel.fromJson(jsonDecode(res.body)).data!;
      getAllEmoployeeList();
    }else{
      print("Failed ${jsonDecode(res.body)["message"]}");
    }
    isGetting.value = false;
  }

  //DELETE
  deleteSalary(id)async{
    var res = await ApiServices.deleteApi("${AppConfig.SALARY_DELETE}$id");
    if(res.statusCode == 200){
      Get.back();
      getAllSalary(dateTimeController.month, dateTimeController.year);
      Get.snackbar("Successful", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.green,colorText: Colors.white);

    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red);
    }
  }

  //update salary
  updateSalary()async{
    isAdding.value = true;
    Map<String, dynamic> body = {
      "employeeID": selectedEmployee.value.id.toString(),
      "payBy": selectedPayMethod.value,
      "check_no" : checkNo.value.text,
      "amount": amount.value.text,
      "date": selectDateDatabase.value.text,
    };
    print("Body -- $body");
    var res = await ApiServices.putApi("${AppConfig.UPDATE_SALARY_LIST}${selectedEmployee.value.id.toString()}", body);
    if(res.statusCode == 200){
      clearAllData();
      Get.back();
      getAllSalary(dateTimeController.month, dateTimeController.year);
      Get.snackbar("Successful", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.green,colorText: Colors.white);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red);
    }
    isAdding.value = false;
  }


  //set sae data
  setSalaryData(SalaryItem data){
    isForEdit.value = true;
    selectedEmployee.value = SingleEmployee(id: data.id, name: data.employeeName);
    selectedPayMethod.value = data.payBy!;
    checkNo.value.text = data.checkNo!;
    amount.value.text = data.amount.toString();
    selectDateDatabase.value.text = data.date!;
    selectDateShow.value.text = dateTimeController.dateFormat1(DateTime.parse(data.date!)).toString();
    print("isForEdit -- ${isForEdit.value}");
    Get.toNamed(AppRoute.addPaidSalary); //navigate to add paid salary
  }

  //clear all data
  clearAllData(){
    isForEdit.value = false;
    checkNo.value.clear();
    amount.value.clear();
    selectDateDatabase.value.clear();
    selectDateShow.value.clear();
  }

}