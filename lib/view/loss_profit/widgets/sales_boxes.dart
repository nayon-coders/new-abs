import 'package:abs_office_management/view/loss_profit/controller/lossProfit_controller.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../utility/assetes.dart';
import '../../dashboard_screen/widget/dash_box.dart';
import 'loading_boxs_view.dart';

class SalesBoxes extends GetView<LossProfitController> {
  const SalesBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      if(controller.isLoading.value){
        return LoadingLossProfitBoxsView();
      }else{
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sales",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ).animate(effects: [
                FadeEffect(duration: 140.ms, curve: Curves.bounceInOut),
                ScaleEffect(begin: Offset(0,2), curve: Curves.easeIn)
              ]
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: DashBox(
                        onClick:(){},
                        costName: "Gross sales",
                        costAmount: "${controller.lossProfitModel.value.totalSalesRegister}",
                        image:Assets.money,
                        bgColor: Color(0xFFFFF5D9)
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: DashBox(
                        onClick:(){},
                        costName: "Net Sales ",
                        costAmount: "${controller.netSales.value.toStringAsFixed(2)}",
                        image:Assets.income,
                        bgColor:Color(0xFFE7EDFF)
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: DashBox(
                        onClick:(){},
                        costName: "Online Sales",
                        costAmount: "${controller.lossProfitModel.value.toatlOnlineSales!.toStringAsFixed(2)}",
                        image:Assets.onlineSales,
                        bgColor: Color(0xFFFAEEDC)
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: DashBox(
                        onClick:(){},
                        costName: "Total Sales",
                        costAmount: "${controller.lossProfitModel.value!.totalSales!.toStringAsFixed(2)}",
                        image:Assets.todaysale,
                        bgColor: Color(0xFFDCFAF8)
                    ),
                  )
                ],
              ),
            ].animate(interval: 100.ms).fade(duration: 300.ms),
          ),
        );
      }

      }
    );
  }
}

