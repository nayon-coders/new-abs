import 'package:abs_office_management/view/settings/controller/tax.controller.dart';
import 'package:get/get.dart';
class TaxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaxController>(() => TaxController());
  }
}