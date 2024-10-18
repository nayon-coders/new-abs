import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:abs_office_management/view/today_sales_management/screen/add_cost.dart';
import 'package:abs_office_management/view/today_sales_management/screen/add_food_cost.dart';
import 'package:abs_office_management/view/today_sales_management/screen/add_today_sales.dart';
import 'package:abs_office_management/view/today_sales_management/widget/edit_button.dart';
import 'package:abs_office_management/view/today_sales_management/widget/table/app_table.dart';
import 'package:abs_office_management/view/today_sales_management/widget/table/table_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';

class TodaySalesManagement extends StatelessWidget {
  const TodaySalesManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: AppColors.bgColor,
            appBar: AppBar(
              backgroundColor: AppColors.textWhite,
              leading: IconButton(
                  onPressed: ()=>Get.toNamed(RouteName.dashBoard),
                  icon: const Icon(Icons.arrow_back_ios,color: AppColors.textindico,)),
              title:const Text("Today Sales Management",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textindico),
              ),
              centerTitle: true,
              actions: [
                Image.asset(Assets.calander,height: 30,width: 30,fit: BoxFit.contain,),
                const SizedBox(width: 10,),
              ],
              bottom:  PreferredSize(
                preferredSize:const Size.fromHeight(50),
                child: Container(
                  color: AppColors.bgColor,
                  child:const TabBar(
                    dividerColor: Colors.transparent,
                      tabs: [
                    Tab(text: "Today Sales",),
                    Tab(text: "Today Cost",),
                    Tab(text: "Food Cost",),
                  ]),
                ),
              ),
            ),
            body: TabBarView(
                children: [


                  ///-------Today Sales--------
                  AppTable(
                    headerChildren: const[
                      TableHeader(width: 80, name: "Net Sales"),
                      TableHeader(width: 80, name: "Net Sales"),
                      TableHeader(width: 55, name: "SOV"),
                      TableHeader(width: 120, name: "Action"),

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
                                      width: 80,
                                      child: Text("\$100,000",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),)),
                                  SizedBox(
                                      width: 80,
                                      child: Text("\$40,500",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),)),
                                  SizedBox(
                                      width: 55,
                                      child: Text("\$40,500",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),)),
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

                          }),
                    ),
                  ),





                  ///--------Today Cost ------

                  AppTable(
                    headerChildren: const[
                      TableHeader(width: 80, name: "Date"),
                      TableHeader(width: 80, name: "Name"),
                      TableHeader(width: 55, name: "Amount"),
                      TableHeader(width: 120, name: "Action"),

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
                                      width: 80,
                                      child: Text("14 Jan, 2024",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),)),
                                  SizedBox(
                                      width: 80,
                                      child: Text("Wifi Bill",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),)),
                                  SizedBox(
                                      width: 55,
                                      child: Text("\$40,500",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),)),
                                  SizedBox(
                                      width: 120,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          EditButton(
                                              bgColor: Color(0xFF1814F3),
                                              onClick: ()=>Get.to(()=>AddCost())
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

                          }),
                    ),
                  ),







                  ///---------Food Cost--------
                  AppTable(
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
                  ),


            ]),


            floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
            floatingActionButton: ExpandableFab(
              initialOpen: true,
              distance: 80.0, // FAB-er icon-gulor space adjust korte hobe
              children: [
                FloatingActionButton.small(
                  onPressed: () {
                    print('Action 1');
                  },
                  tooltip: 'Action 1',
                  child: Icon(Icons.add,color: Colors.amber,),
                ),
                FloatingActionButton.small(
                  onPressed: () {
                    print('Action 2');
                  },
                  tooltip: 'Action 2',
                  child: Icon(Icons.edit),
                ),
                FloatingActionButton.small(
                  onPressed: () {
                    print('Action 3');
                  },
                  tooltip: 'Action 3',
                  child: Icon(Icons.delete),
                ),
              ],
            ),


              ),
        ));
  }
}
