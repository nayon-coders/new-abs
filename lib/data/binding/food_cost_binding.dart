import 'package:get/get.dart';

import '../../view/today_sales_management/controller/cost_controller.dart';
import '../../view/today_sales_management/controller/food_cost_controller.dart';
class FoodCostBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FoodCostController>(() => FoodCostController());
  }
}