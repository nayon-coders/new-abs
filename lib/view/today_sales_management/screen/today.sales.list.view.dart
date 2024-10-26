import 'package:abs_office_management/view/today_sales_management/controller/sales_controller.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';
import '../widget/edit_button.dart';
import '../widget/table/app_table.dart';
import '../widget/table/table_body.dart';
import '../widget/table/table_header.dart';
import 'add_today_sales.dart';

class TodaySalesView extends GetView<SalesController> {
  const TodaySalesView({super.key});

  @override
  Widget build(BuildContext context) {
    return   AppTable(
      headerChildren: const[
        TableHeader(width: 80, name: "Net Sales"),
        TableHeader(width: 80, name: "Net Sales"),
        TableHeader(width: 55, name: "SOV"),
        TableHeader(width: 120, name: "Action"),

      ],
      row: Expanded(
        child: Obx(() {
          if(controller.isLoading.value){
            return _buildLoadingWidget(); // Loading widget
          }else{
            return ListView.separated(
                itemCount: 10,
                separatorBuilder: (_, __) => Container(height: 1.5, color: Colors.grey[300]),
                itemBuilder: (context,index){
                  return SizedBox(
                    height: 60,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TableBody(
                          width: 80,
                          text: "\$40,500",
                        ),
                        TableBody(
                          width: 80,
                          text: "\$40,500",
                        ),
                        TableBody(
                          width: 55,
                          text: "\$40,500",
                        ),

                        SizedBox(
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                EditButton(
                                  bgColor: Color(0xFF1814F3),
                                  onClick: ()=>Get.to(()=>AddTodaySales()),
                                ),
                                EditButton(
                                    icon: Icons.remove_red_eye,
                                    bgColor: Color(0xFF15A144),
                                    onClick: (){}
                                ),
                                EditButton(
                                    icon: Icons.delete,
                                    bgColor: Color(0xFFFE5C73),
                                    onClick: (){}
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

