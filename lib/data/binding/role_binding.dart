import 'package:get/get.dart';

import '../../controller/role_managment_controller.dart';

class RoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleManagmentController>(() => RoleManagmentController());

  }
}