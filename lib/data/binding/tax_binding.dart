import 'package:abs_office_management/view/settings/controller/tax.controller.dart';
import 'package:get/get.dart';

import '../../controller/role_managment_controller.dart';
class TaxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleManagmentController>(() => RoleManagmentController());
    Get.lazyPut<TaxController>(() => TaxController());
  }
}