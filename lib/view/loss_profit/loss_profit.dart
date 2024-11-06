import 'package:abs_office_management/controller/date_time_controller.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/loss_profit/controller/lossProfit_controller.dart';
import 'package:abs_office_management/view/loss_profit/widgets/cost_box_widgets.dart';
import 'package:abs_office_management/view/loss_profit/widgets/loss_profit_view.dart';
import 'package:abs_office_management/view/loss_profit/widgets/sales_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utility/assetes.dart';
import 'widgets/onlie_sales_widgets.dart';

class LossProfit extends GetView<LossProfitController> {
   LossProfit({super.key});

   final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios)),
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
        title: const Text("Loss profit",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        actions: [
          InkWell(
              onTap: ()async{
                  await dateTimeController.pickDate(context);
                  controller.getLossProfitData(dateTimeController.month, dateTimeController.year);
                  controller.getOnlineSales(dateTimeController.month, dateTimeController.year);
              },
              child: Image.asset(Assets.calander,height: 25,width: 25,fit: BoxFit.cover,)),
          const SizedBox(width: 15,),
        ],
      ),
      body: SingleChildScrollView(
       // padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            LossProfitWidgets(dateTimeController: dateTimeController),


            SalesBoxes(), //imported from widgets/sales_boxes.dart
            CostBoxsWidgets(), // imported from widgets/cost_box_widgets.dart

            OnlineSalesWidgets(), // imported from widgets/online_sales_widgets.dart




        
          ],
        ),
      ),
    );
  }



  //dashbox Menu
  List<Map<String,dynamic>> dashbox=[
    {"costName": "Total Sells","costAmount":"1235", "image": Assets.money,"color":const Color(0xFFFFF5D9), "screen": (){}},
    {"costName": "Net Income", "costAmount":"1235","image": Assets.income,"color":const Color(0xFFE7EDFF), "screen": (){}},
    {"costName": "Expense", "costAmount":"1235","image": Assets.expance,"color":const Color(0xFFFFE0EB), "screen": (){}},
    {"costName": "Online Sells", "costAmount":"1235","image": Assets.sells,"color":const Color(0xFFDCFAF8), "screen": (){}},

  ];
   List<Map<String,dynamic>> costBox=[
     {"costName": "Total Salary","costAmount":"1235", "image": Assets.money,"color":const Color(0xFFFFF5D9), "screen": (){}},
     {"costName": "Net Income", "costAmount":"1235","image": Assets.income,"color":const Color(0xFFE7EDFF), "screen": (){}},
     {"costName": "Expense", "costAmount":"1235","image": Assets.expance,"color":const Color(0xFFFFE0EB), "screen": (){}},
     {"costName": "Online Sells", "costAmount":"1235","image": Assets.sells,"color":const Color(0xFFDCFAF8), "screen": (){}},

   ];
}
