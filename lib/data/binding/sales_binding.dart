import 'package:get/get.dart';

import '../../controller/date_time_controller.dart';
import '../../view/settings/controller/online.sales.platform.controller.dart';
import '../../view/settings/controller/tax.controller.dart';
import '../../view/today_sales_management/controller/sales_controller.dart';
class SalesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesController>(() => SalesController());
    Get.lazyPut<OnlineSalesPlatformController>(() => OnlineSalesPlatformController());
    Get.lazyPut<DateTimeController>(() => DateTimeController());

    //  Get.lazyPut<TaxController>(() => TaxController());
  }
}