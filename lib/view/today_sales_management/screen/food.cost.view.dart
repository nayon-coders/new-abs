import 'package:abs_office_management/controller/date_time_controller.dart';
import 'package:abs_office_management/data/model/food_cost_model.dart';
import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_const.dart';
import 'package:abs_office_management/view/today_sales_management/controller/food_cost_controller.dart';
import 'package:abs_office_management/view/today_sales_management/widget/table/table_body.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';
import '../widget/edit_button.dart';
import '../widget/table/app_table.dart';
import '../widget/table/table_header.dart';
import 'add_cost.dart';
import 'add_food_cost.dart';

class FoodCostView extends GetView<FoodCostController> {
   FoodCostView({super.key});

   final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return  AppTable(
      headerChildren: const[
        TableHeader(width: 60, name: "Date"),
        TableHeader(width: 130, name: "Name"),
        TableHeader(width: 120, name: "Action"),

      ],
      row: Expanded(
        child: Obx(() {
          if(controller.isLoading.value){
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
                return AppShimmerPro.circularShimmer(width: Get.width, height: 50, borderRadius: 5);
              },
            );
          }else if(controller.foodCostModel.value.result!.isEmpty){
            return Column(
              children: [
                Center(child: Text("No data found")),
                SizedBox(height: 10),
                TextButton(
                  onPressed: ()=>controller.getAllFoodCost(dateTimeController.month, dateTimeController.year),
                  child: Text("Reload"),
                )
              ],
            );

          }else{
            return ListView.separated(
                itemCount: controller.foodCostModel.value.result!.length,
                separatorBuilder: (_, __) => Container(height: 1.5, color: Colors.grey[300]),
                itemBuilder: (context,index){
                  var data = controller.foodCostModel.value.result![index];
                  return Container(
                    height: 60,
                    color: index.isEven ? Colors.grey[100] : Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TableBody(text: "${dateTimeController.dateFormat1(data.date!)}", width: 60),
                        TableBody(text: "${data.name}", width: 130),

                        SizedBox(
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EditButton(
                                  bgColor: Color(0xFF1814F3),
                                  onClick: (){
                                    controller.clearAllData();
                                    controller.setEditData(data);
                                  },
                                ),
                                EditButton(
                                    icon: Icons.remove_red_eye,
                                    bgColor: AppColors.green,
                                    onClick: (){
                                      showDetails(context, data);
                                    }
                                ),
                                EditButton(
                                    icon: Icons.delete,
                                    bgColor: Color(0xFFFE5C73),
                                    onClick: (){
                                      alertDialog(
                                          title: "Hold On!",
                                          content: "Are you sure you want to delete this food cost?",
                                          onOk: (){
                                            controller.deleteFoodCost(data.id.toString());
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

  showDetails(context, FoodCostResult data, ){
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return  Container(
            height: Get.height,
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
               Center(
                 child: Text("Total Cost: \$${data.data!.map((e) => e.vendorAmount).reduce((a, b) => (double.parse("${a!}") + double.parse("${b!}")).toStringAsFixed(2))}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
               ),

                SizedBox(height: 10),
                Text("Vendors",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    //shrinkWrap: true,
                    itemCount: data.data!.length,
                    itemBuilder: (context,index){
                      var item = data.data![index];
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                  
                        ),
                        child: ListTile(
                          title: Text(item!.vendorName!),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Amount: \$${item.vendorAmount}"),
                              Text("Pay By: \$${item.payBy}"),
                              item.checkNo!.isEmpty ? Center() :  Text("Cheque Number: ${item.checkNo}"),
                            ],
                          ),
                        ),
                      ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
