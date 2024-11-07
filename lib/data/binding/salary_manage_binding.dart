import 'package:abs_office_management/view/salery_management/controller/salary_management_controller.dart';
import 'package:get/get.dart';

import '../../controller/date_time_controller.dart';
import '../../controller/role_managment_controller.dart';
import '../../view/today_sales_management/controller/sales_controller.dart';
class SalaryManageBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<SalesController>(() => SalesController());
    Get.lazyPut<DateTimeController>(() => DateTimeController());
    Get.lazyPut<SalaryManagementController>(() => SalaryManagementController());
    Get.lazyPut<RoleManagmentController>(() => RoleManagmentController());

  }
}