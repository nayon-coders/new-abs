
import 'package:get/get.dart';

import '../model/taxStateModel.dart';


class GlobalVariables{
  //static instance
  // static Rx<MyProfileModel> gMyProfileModel = MyProfileModel().obs;
  static Rx<TaxStateModel> gTaxStateModel = TaxStateModel().obs;
  static RxBool gIsTaxStatus = false.obs;

}