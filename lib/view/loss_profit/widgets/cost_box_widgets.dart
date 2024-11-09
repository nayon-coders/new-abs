import 'package:abs_office_management/view/loss_profit/controller/lossProfit_controller.dart';
import 'package:abs_office_management/view/loss_profit/widgets/loading_boxs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../utility/assetes.dart';
import '../../dashboard_screen/widget/dash_box.dart';
import '../../settings/controller/creditcard_processing_fee_controller.dart';

class CostBoxsWidgets extends GetView<LossProfitController> {
   CostBoxsWidgets({super.key});
  CreditcardProcessingFeeController creditcardController = Get.put(CreditcardProcessingFeeController());

  @override
  Widget build(BuildContext context) {
    return   Obx((){
      if(controller.isLoading.value) {
        return const LoadingLossProfitBoxsView();
      }else{
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Expense",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ).animate(effects: [
                FadeEffect(duration: 200.ms, curve: Curves.bounceInOut),
               const  ScaleEffect(begin: Offset(0,2), curve: Curves.easeIn)
              ]),
             const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: DashBox(
                        onClick:(){},
                        costName: "Food Cost",
                        costAmount: controller.lossProfitModel.value.foodCost!.toStringAsFixed(2),
                        image:Assets.foodCost,
                        bgColor:const Color(0xFFFFF5D9)
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: DashBox(
                        onClick:(){},
                        costName: "Total Salary",
                        costAmount: controller.lossProfitModel.value.totalSalary!.toStringAsFixed(2),
                        image:Assets.salery,
                        bgColor:const Color(0xFFE7EDFF)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: DashBox(
                        onClick:(){},
                        costName: "Short & Over",
                        costAmount: controller.lossProfitModel.value.shortOver!.toStringAsFixed(2),
                        image:Assets.shotOver,
                        bgColor:const  Color(0xffF9f3E3)
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: DashBox(
                        onClick:(){},
                        costName: "Others\nExpanses",
                        costAmount: controller.lossProfitModel.value.othersCost!.toStringAsFixed(2),
                        image:Assets.loss,
                        bgColor: const Color(0xFFDCFAF8)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: DashBox(

                        onClick:(){},
                        costName: "Total Tax",
                        costAmount: controller.lossProfitModel.value.totalTax!.toStringAsFixed(2),
                        image:Assets.tax,
                        bgColor: const Color(0xFFDCEAF9)
                    ),
                  ),
                  const SizedBox(width: 20,),


                  ///TODO:Credit Card Fee add
                  Expanded(
                    child: DashBox(

                        onClick:(){},
                        costName: "Credit card fee",
                        costAmount: "${double.parse(controller.lossProfitModel.value.totalCreditSales.toString())-(double.parse(creditcardController.creditModel.value.data?.fee?.toStringAsFixed(2)) )}"?? "0.0",
                        image:Assets.expance,
                        bgColor: const Color(0xFFDCEAF9)
                    ),
                  ),
                ],
              ),
            ].animate(interval: 120.ms).fade(duration: 300.ms),
          ),
        );
      }

      }
    );
  }
}
