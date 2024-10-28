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
    getAllEmoployeeList();
  }

  //all employe
  RxList<SingleEmployee> employeeList = <SingleEmployee>[].obs;
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

  getAllEmoployeeList()async{
    await employeeManageController.allEmployeeList();
    employeeList.value = employeeManageController.employeeListModel.value.data!;
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
      getAllSalary(dateTimeController.month, dateTimeController.year);
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