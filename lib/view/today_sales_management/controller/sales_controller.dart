import 'package:get/get.dart';
class SalesController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isEdit = false.obs;
  RxBool isAdd = false.obs;
  RxBool isDelete = false.obs;
  RxBool isView = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
  }

  //get all sales
  void getSales() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }


}