import 'package:get/get.dart';

import '../../view/today_sales_management/controller/sales_controller.dart';
class SalaryManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesController>(() => SalesController());
  }
}