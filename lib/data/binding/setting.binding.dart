import 'package:abs_office_management/data/model/online.platform.model.dart';
import 'package:abs_office_management/view/settings/controller/online.sales.platform.controller.dart';
import 'package:abs_office_management/view/settings/controller/tax.controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<OnlineSalesPlatformController>(() => OnlineSalesPlatformController());
     Get.lazyPut<TaxController>(() => TaxController());
  }
}