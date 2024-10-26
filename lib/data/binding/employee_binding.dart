import 'package:abs_office_management/view/employee_management/controller/employee_manage_controller.dart';
import 'package:get/get.dart';


class EmployeeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EmployeeManageController>(()=>EmployeeManageController());
  }

}