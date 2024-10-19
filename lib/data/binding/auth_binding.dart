import 'package:get/get.dart';

import '../../view/auth/controller/auth_controller.dart';
//AuthController binging get
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}