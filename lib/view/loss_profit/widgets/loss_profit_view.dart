import 'package:abs_office_management/controller/amount_formate.dart';
import 'package:abs_office_management/view/loss_profit/controller/lossProfit_controller.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../controller/date_time_controller.dart';
import '../../../utility/app_color.dart';

class LossProfitWidgets extends GetView<LossProfitController> {
  const LossProfitWidgets({
    super.key,
    required this.dateTimeController,
  });

  final DateTimeController dateTimeController;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 180,
      decoration:const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20)
        ),
      ),
      child: Obx(() {
        if(controller.isLoading.value){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             AppShimmerPro.TextShimmer(width: 200, maxLine: 2, alignment: Alignment.center),

             const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:const EdgeInsets.all(10),
                    decoration:const BoxDecoration(
                      // color: Colors.red.withOpacity(0.2),
                        border: Border(
                          right: BorderSide(
                            color: Colors.green,
                            width: 1,
                          ),
                        )
                    ),
                    child: Column(
                      children: [
                         AppShimmerPro.TextShimmer(width: 140, maxLine: 2, alignment: Alignment.center).animate().fade(begin: 0.1, duration: Duration(milliseconds: 700)),
                      ],
                    ),
                  ),
                  Container(
                    padding:const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        AppShimmerPro.TextShimmer(width: 140, maxLine: 2, alignment: Alignment.center).animate().fade(begin: 0.1, duration: Duration(milliseconds: 700)),
                      ],
                    ),
                  )
                ],
              )
            ],
          );
        }else{
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Loss & Profit",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.textBlack),
              ),
              Obx(() {
                return Text(dateTimeController.dateFormat1(DateTime.parse(dateTimeController.selectedDate.toString())),
                  style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.textBlack),
                );
              }
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:const EdgeInsets.all(10),
                    decoration:const BoxDecoration(
                      // color: Colors.red.withOpacity(0.2),
                        border: Border(
                          right: BorderSide(
                            color: Colors.green,
                            width: 1,
                          ),
                        )
                    ),
                    child: Column(
                      children: [
                        Text(FormatCurrency.formatCurrency(controller.lossProfitModel.value.totalProfit!.toStringAsFixed(2)), ///TODO need to calculate from backend
                          style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColors.mainColor),
                        ).animate().fade(begin: 0.1, duration:const Duration(milliseconds: 1000)),
                       const Text("Total Profit",
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.mainColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text("\$${controller.lossProfitModel.value.totalLoss!.toStringAsFixed(2)}",
                          style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColors.red),
                        ).animate().fade(begin: 0.1, duration:const Duration(milliseconds: 1000)),
                       const Text("Total Loss",
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.red),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          );
        }

        }
      ),
    );
  }
}
