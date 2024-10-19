import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';
import '../widget/edit_button.dart';
import '../widget/table/app_table.dart';
import '../widget/table/table_header.dart';
import 'add_cost.dart';
import 'add_food_cost.dart';

class FoodCostView extends StatelessWidget {
  const FoodCostView({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppTable(
      headerChildren: const[
        TableHeader(width: 90, name: "Date"),
        TableHeader(width: 90, name: "Name"),
        TableHeader(width: 60, name: "Amount"),
        Align(
            alignment: Alignment.center,
            child: TableHeader(width: 90, name: "Action")),

      ],
      row: Expanded(
        child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (_, __) => Container(height: 1.5, color: Colors.grey[300]),
            itemBuilder: (context,index){
              return SizedBox(
                height: 60,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 90,
                        child: Text("14 Jan, 2024",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),)),
                    SizedBox(
                        width: 90,
                        child: Text("Wifi Bill",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),)),
                    SizedBox(
                        width: 60,
                        child: Text("\$40,500",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),)),
                    SizedBox(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            EditButton(
                              bgColor: Color(0xFF1814F3),
                              onClick: ()=>Get.to(()=>AddFoodCost()),
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

            }),
      ),
    );
  }
}
