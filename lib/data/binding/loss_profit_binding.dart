import 'package:get/get.dart';

import '../../view/loss_profit/controller/lossProfit_controller.dart';
import '../../view/today_sales_management/controller/sales_controller.dart';
class LossProfitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LossProfitController>(() => LossProfitController());
  }
}