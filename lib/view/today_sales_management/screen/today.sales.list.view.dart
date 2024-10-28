import 'package:abs_office_management/utility/app_const.dart';
import 'package:abs_office_management/view/today_sales_management/controller/sales_controller.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:abs_office_management/widgets/no_data_find.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/date_time_controller.dart';
import '../../../routes/route_name.dart';
import '../../../utility/app_color.dart';
import '../widget/edit_button.dart';
import '../widget/table/app_table.dart';
import '../widget/table/table_body.dart';
import '../widget/table/table_header.dart';
import 'add_today_sales.dart';

class TodaySalesView extends GetView<SalesController> {
   TodaySalesView({super.key});

  final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return   AppTable(
      headerChildren: const[
        TableHeader(width: 60, name: "Date"),
        TableHeader(width: 90, name: "Gross Sales"),
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
                    margin: EdgeInsets.only(bottom: 10, left: 2, right: 2),
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                        color: AppColors.textWhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1)
                          )
                        ]
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
                          text: "\$${data.salesRegister}",
                        ),
                        TableBody(
                          width: 60,
                          color: double.parse(data.soOv!) < 0 ? Colors.red : Colors.green,
                          text: "\$${data.soOv}",
                        ),

                        SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EditButton(
                                  bgColor: Color(0xFF1814F3),
                                  onClick: (){
                                    controller.setDataForEdit(data);
                                    Get.toNamed(AppRoute.addTodaySalesScreen);
                                  },
                                ),
                                EditButton(
                                    icon: Icons.remove_red_eye,
                                    bgColor: Color(0xFF15A144),
                                    onClick: ()=>Get.toNamed(AppRoute.vieSalesReport, arguments: data)
                                ),
                                Obx(() {
                                    return EditButton(
                                      isLoading: controller.isDelete.value,
                                        icon: Icons.delete,
                                        bgColor: Color(0xFFFE5C73),
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
                  );

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

