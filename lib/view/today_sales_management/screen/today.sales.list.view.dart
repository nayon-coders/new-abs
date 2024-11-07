import 'package:abs_office_management/controller/amount_formate.dart';
import 'package:abs_office_management/utility/app_const.dart';
import 'package:abs_office_management/view/today_sales_management/controller/sales_controller.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:abs_office_management/widgets/no_data_find.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../controller/date_time_controller.dart';
import '../../../routes/route_name.dart';
import '../../../utility/app_color.dart';
import '../widget/edit_button.dart';
import '../widget/table/app_table.dart';
import '../widget/table/table_body.dart';
import '../widget/table/table_header.dart';


class TodaySalesView extends GetView<SalesController> {
   TodaySalesView({super.key});

  final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return   AppTable(
      headerChildren: const[
        TableHeader(width: 60, name: "Date"),
        TableHeader(width: 90, name: "Today Sales"),
        TableHeader(width: 60, name: "SOV"),
        TableHeader(width: 120, name: "Action"),

      ],
      row: Expanded(
        child: Obx(() {
          if(controller.isLoading.value) {
            return _buildLoadingWidget();
          }else if(controller.allSalesList.value.data!.isEmpty){
            return NoDataFoundScreen(
              message: "No data found",
              onRetry: ()=>controller. getSales(dateTimeController.month, dateTimeController.year),
            );
          }else{
            return ListView.separated(
                itemCount: controller.allSalesList.value.data!.length,
                separatorBuilder: (_, __) => Container(height: 1.5, color: Colors.grey[300]),
                itemBuilder: (context,index){
                  var data = controller.allSalesList.value.data![index];
                  return Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 10, left: 2, right: 2),
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                        color: index.isEven ? Colors.grey.shade200 : AppColors.textWhite,


                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TableBody(
                          width: 60,
                          text: "${dateFormat1(data.date!)}",
                        ),
                        TableBody(
                          width: 90,
                          //text: "\$${NumberFormat("##,##,###").format(double.parse(data.salesRegister.toString()))}",
                          text: FormatCurrency.formatCurrency(data.salesRegister.toString()),

                        ),
                        TableBody(
                          width: 60,
                          color: double.parse(data.soOv!) < 0 ? Colors.red : Colors.green,
                          text:FormatCurrency.formatCurrency(double.parse("${data.soOv}").abs().toString()),

                        ),

                        SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EditButton(
                                  bgColor: const Color(0xFF1814F3),
                                  onClick: (){
                                    controller.setDataForEdit(data);
                                    Get.toNamed(AppRoute.addTodaySalesScreen);
                                  },
                                ),
                                EditButton(
                                    icon: Icons.remove_red_eye,
                                    bgColor:const Color(0xFF15A144),
                                    onClick: ()=>Get.toNamed(AppRoute.vieSalesReport, arguments: data)
                                ),
                                Obx(() {
                                    return EditButton(
                                      isLoading: controller.isDelete.value,
                                        icon: Icons.delete,
                                        bgColor:const Color(0xFFFE5C73),
                                        onClick: (){
                                          alertDialog(
                                              title: "Hold on!",
                                              content: "Are you sure you want to delete this data?",
                                              onOk: (){
                                                controller.deleteSales(data.id.toString());
                                                Get.back();
                                              }
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

  ListView _buildLoadingWidget() {
    return ListView.separated(
              itemCount: 10,
              separatorBuilder: (_, __) => Container(height: 1.5, color: Colors.grey[300]),
              itemBuilder: (context,index){
                return AppShimmerPro.circularShimmer(width: Get.width, height: 45, borderRadius: 10);
              });
  }
}

