import 'package:abs_office_management/data/model/online.platform.model.dart';
import 'package:abs_office_management/view/today_sales_management/controller/sales_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app_config.dart';
import '../../../data/services/api_services.dart';
class OnlineSalesPlatformController extends GetxController {

  final SalesController salesController = Get.put(SalesController());

  //oninit
  @override
  void onInit() {
    super.onInit();
    getOnlineSalesPlatform();
  }

  //onReady
  @override
  void onReady() {
    super.onReady();
    getOnlineSalesPlatform();
  }

  //onClose
  @override
  void onClose() {
    super.onClose();
  }

  //Rx text editing controller
  Rx<TextEditingController> platformName = TextEditingController().obs;


  //bool rx
  RxBool isAdding = false.obs;
  RxBool isGetting = false.obs;
  RxBool isUpdating = false.obs;
  RxBool isDeleting = false.obs;

  //RX model
  Rx<OnlineSalesPlatformModel> onlineSalesPlatformModel = OnlineSalesPlatformModel().obs;


  //add online sales platform
  addOnlineSalesPlatform() async {
    isAdding.value = true;
    var data = {
      "name": platformName.value.text
    };
    var res = await ApiServices.postApi(AppConfig.ONLINE_SALES_PLATFORM_CREATE, data);
    isAdding.value = false;
    if(res.statusCode == 201){
      clearTextEditingController();
      getOnlineSalesPlatform();
    }
  }


  //get all online sales platform
  getOnlineSalesPlatform() async {
    isGetting.value = true;
    salesController.platformNameList.clear();
    var res = await ApiServices.getApi(AppConfig.ONLINE_SALES_PLATFORM);
    isGetting.value = false;
    if(res.statusCode == 200){
      onlineSalesPlatformModel.value = onlineSalesPlatformModelFromJson(res.body);
      salesController.platformNameList.value = onlineSalesPlatformModel.value.data!;

    }
  }

  //update online sales platform
  updateOnlineSalesPlatform(data) async {
    isUpdating.value = true;
    var res = await ApiServices.putApi(AppConfig.ONLINE_SALES_PLATFORM_UPDATE, data);
    isUpdating.value = false;
    if(res.statusCode == 200){
      Get.back();
    }
  }

  //delete online sales platform
  deleteOnlineSalesPlatform(id) async {
    isDeleting.value = true;
    var res = await ApiServices.deleteApi(AppConfig.ONLINE_SALES_PLATFORM_DELETE+id);
    if(res.statusCode == 200){
      getOnlineSalesPlatform();
    }
    isDeleting.value = false;
  }


  //clear text editing controller
  clearTextEditingController(){
    platformName.value.clear();
  }

}