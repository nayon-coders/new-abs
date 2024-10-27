import 'package:get/get.dart';

import '../../controller/date_time_controller.dart';
import '../../view/today_sales_management/controller/sales_controller.dart';
class SalaryManageBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<SalesController>(() => SalesController());
    Get.lazyPut<DateTimeController>(() => DateTimeController());
  }
}