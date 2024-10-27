import 'package:get/get.dart';

import '../../view/today_sales_management/controller/cost_controller.dart';
class CostingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CostController>(() => CostController());
  }
}