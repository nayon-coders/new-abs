import 'package:abs_office_management/main.dart';
import 'package:get/get.dart';

class RoleManagmentController extends GetxController {
  RxBool isPartner = false.obs;
  RxString role = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkRole();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    checkRole();
  }


  void checkRole() {
    role.value = sharedPreferences!.getString("role")!;
    if (sharedPreferences!.getString("role")!.toLowerCase() == 'partner') {
      isPartner.value = true;

    } else {
      isPartner.value = false;
    }
  }


}