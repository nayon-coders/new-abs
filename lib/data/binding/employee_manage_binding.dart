import 'package:get/get.dart';

import '../../view/employee_management/controller/employee_manage_controller.dart';
import '../../view/today_sales_management/controller/sales_controller.dart';
class EmployeeManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesController>(() => SalesController());
    Get.lazyPut<EmployeeManageController>(() => EmployeeManageController());
  }
}