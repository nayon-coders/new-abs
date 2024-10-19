import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:abs_office_management/view/today_sales_management/screen/food.cost.view.dart';
import 'package:abs_office_management/view/today_sales_management/screen/today.cost.view.dart';
import 'package:abs_office_management/view/today_sales_management/screen/today.sales.list.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';

class TodaySalesManagement extends StatelessWidget {
  const TodaySalesManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.textWhite,
          leading: IconButton(
              onPressed: ()=>Get.toNamed(AppRoute.dashBoard),
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
              TodaySalesView(), //Today Sales

              //Today Cost
              TodayCostView(), //Today Cost

              //Food Cost
              FoodCostView(), //Food Cost


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
    );
  }
}
