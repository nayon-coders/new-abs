import 'package:abs_office_management/view/auth/forgot_password/forgot_controller/forgot_controller.dart';
import 'package:get/get.dart';

import '../../view/auth/controller/auth_controller.dart';
//AuthController binging get
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ForgotController>(() => ForgotController());
  }
}