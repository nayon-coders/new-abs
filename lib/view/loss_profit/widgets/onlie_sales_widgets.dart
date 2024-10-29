import 'package:abs_office_management/view/loss_profit/controller/lossProfit_controller.dart';
import 'package:abs_office_management/view/loss_profit/widgets/loading_boxs_view.dart';
import 'package:abs_office_management/view/loss_profit/widgets/online_sales_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../utility/assetes.dart';
import '../../dashboard_screen/widget/dash_box.dart';

class OnlineSalesWidgets extends GetView<LossProfitController> {
  const OnlineSalesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      if(controller.isOnlineSalesLoading.value){
        return LoadingLossProfitBoxsView();
      }else{
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text("Online Sales",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate(effects: [
                  FadeEffect(duration: 200.ms, curve: Curves.bounceInOut),
                  ScaleEffect(begin: Offset(0,2), curve: Curves.easeIn)
                ]
                ),
              ),
              SizedBox(height: 10,),
              GridView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: controller.onlineSalesModel.value.data!.length,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 2
                  ), itemBuilder: (context,index){
                    var data = controller.onlineSalesModel.value.data![index];

                return OnlineSalesBox(
                  onClick: (){},
                  costName: data.name!,
                  costAmount: data.amount!,
                  image: "${data.name![0]}",
                  bgColor: Colors.indigoAccent.shade100,
                );
              }),
            ].animate(interval: 150.ms).fade(duration: 300.ms),
          ),
        );
      }

      }
    );
  }
}
