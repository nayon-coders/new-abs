import 'package:abs_office_management/controller/amount_formate.dart';
import 'package:abs_office_management/utility/app_const.dart';
import 'package:abs_office_management/view/today_sales_management/controller/cost_controller.dart';
import 'package:abs_office_management/view/today_sales_management/widget/table/table_body.dart';
import 'package:abs_office_management/widgets/no_data_find.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../controller/date_time_controller.dart';
import '../../../routes/route_name.dart';
import '../../../utility/app_color.dart';
import '../../../widgets/app_shimmer.dart';
import '../widget/edit_button.dart';
import '../widget/table/app_table.dart';
import '../widget/table/table_header.dart';


class TodayCostView extends GetView<CostController> {
   TodayCostView({super.key});

  //global date time controller
  final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return  AppTable(
      headerChildren: const[
        TableHeader(width: 60, name: "Date"),
        TableHeader(width: 129, name: "Name"),
        TableHeader(width: 70, name: "Amount"),
        TableHeader(width: 80, name: "Action"),

      ],
      row: Expanded(
        child: Obx(() {
          if(controller.isCostListGetting.value){
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (_, __) => AppShimmerPro.circularShimmer(width: Get.width, height: 60, borderRadius: 10),
            );
          }else if(controller.costingListModel.value.data == null || controller.costingListModel.value.data!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child:NoDataFoundScreen()),
                TextButton(
                  onPressed: () => controller.getAllCostList(dateTimeController.month, dateTimeController.year),
                  child:const Text("Refresh", style: TextStyle(color: AppColors.textBlue)),
                ),
              ],
            );
          }else{
            return ListView.separated(
                itemCount: controller.allCostList.value.data!.length,
                separatorBuilder: (_, __) => Container(height: 1.5, color: Colors.grey[300]),
                itemBuilder: (context,index){
                  var data = controller.allCostList.value.data![index];
                  return Container(
                    height: 60,
                    color: index.isEven ? AppColors.textWhite : AppColors.bgColor,
                    padding:const EdgeInsets.only(left: 10, right: 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TableBody(text: "${dateTimeController.dateFormat1(data.date!)}", width: 60),
                        TableBody(text: "${data.costName!}", width: 120),
                        TableBody(text: FormatCurrency.formatCurrency(data.amount.toString()), width: 70),

                        SizedBox(
                            width: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                EditButton(
                                    bgColor: const Color(0xFF1814F3),
                                    onClick: (){
                                      controller.setDataForEditCostingList(data);
                                      Get.toNamed(AppRoute.addCosting);
                                    }
                                ),
                                Obx((){
                                    return EditButton(
                                         isLoading: controller.isCostListDelete.value,
                                        icon: Icons.delete,
                                        bgColor: const Color(0xFFFE5C73),
                                        onClick: (){
                                          alertDialog(
                                              title: "Hold On!",
                                              content: "Do you want to delete this item?",
                                              onOk: ()=>controller.deleteCostingList(data.id!.toString())
                                          );
                                        }
                                    );
                                  }
                                ),

                              ],
                            )),

                      ],
                    ),
                  ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut);

                });
          }
          }
        ),
      ),
    );
  }
}
