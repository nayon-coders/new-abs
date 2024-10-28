import 'package:get/get.dart';
import '../../view/partner_management/controller/partner_controller.dart';


class PartnerManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartnerController>(()=>PartnerController());

  }
}