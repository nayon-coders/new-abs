
import 'package:get/get.dart';

class ToggleTabController extends GetxController{

  RxBool isShow = false.obs;

  void toggleTab(bool value){
    isShow.value = value;

  }
}