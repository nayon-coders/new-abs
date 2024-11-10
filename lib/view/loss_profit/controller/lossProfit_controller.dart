import 'dart:convert';

import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/controller/date_time_controller.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:abs_office_management/view/settings/controller/creditcard_processing_fee_controller.dart';
import 'package:abs_office_management/view/settings/controller/tax.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../data/model/loss_profit_model.dart';
import '../../../data/model/online_sales_report_model.dart';
class LossProfitController extends GetxController {
  final TaxController taxController = Get.put(TaxController());
  final CreditcardProcessingFeeController creditcardController = Get.put(CreditcardProcessingFeeController());

  final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLossProfitData(dateTimeController.month, dateTimeController.year);
    getOnlineSales(dateTimeController.month, dateTimeController.year);
  }

  Rx<LossProfitModel> lossProfitModel = LossProfitModel().obs;
  Rx<OnlienSalesRepotModel> onlineSalesModel = OnlienSalesRepotModel().obs;
  RxBool isLoading = false.obs;
  RxBool isOnlineSalesLoading = false.obs;
  RxDouble creditCardProcessingFee = 0.00.obs;
  RxDouble totalSalesAmount = 0.00.obs;
  RxDouble totalProfit = 0.00.obs;

  RxDouble netSales = 0.0.obs;



  
  //get loss profit data
  getLossProfitData(month, year) async {
    isLoading.value = true;
    var response = await ApiServices.getApi(AppConfig.LOSS_PROFIT+"?month=$month&year=$year");
    if (response.statusCode == 200) {
      lossProfitModel.value = LossProfitModel.fromJson(jsonDecode(response.body));
       // calculateAmount(lossProfitModel.value);
    }
    isLoading.value = false;
  }

  //calculate the tax amount
  // calculateAmount(LossProfitModel model)async{
  //   if(creditcardController.creditModel.value.data != null){
  //     creditCardProcessingFee.value = (double.parse("${model.totalCreditSales}")/ 100) * double.parse("${creditcardController.creditModel.value.data!.fee!}");
  //   }else{
  //     creditCardProcessingFee.value = 0.0;
  //   }
  //   netSales.value = double.parse("${model.totalSalesRegister}") - ( double.parse("${model.totalTax}") + creditCardProcessingFee.value );
  //   totalSalesAmount.value = netSales.value + double.parse("${onlineSalesModel.value.totalOnlineSales.toString()}") + double.parse("${model.shortOver}");
  //   totalProfit.value = totalSalesAmount.value - double.parse("${model.totalSalary}") - double.parse("${model.othersCost}");
  // }

  //get online sales
  getOnlineSales(month, year) async {
    isOnlineSalesLoading.value = true;
    var response = await ApiServices.getApi(AppConfig.ONLINE_SALES_REPORT+"?month=$month&year=$year");
    if (response.statusCode == 200) {
      onlineSalesModel.value = OnlienSalesRepotModel.fromJson(jsonDecode(response.body)) ;
    }
    isOnlineSalesLoading.value = false;
  }

  //refresh the data
  Future<void> refreshData() async {
    await getLossProfitData(dateTimeController.month, dateTimeController.year);
    await getOnlineSales(dateTimeController.month, dateTimeController.year);
  }





}