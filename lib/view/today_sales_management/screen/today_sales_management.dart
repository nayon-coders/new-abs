import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:abs_office_management/view/today_sales_management/screen/food.cost.view.dart';
import 'package:abs_office_management/view/today_sales_management/screen/today.cost.view.dart';
import 'package:abs_office_management/view/today_sales_management/screen/today.sales.list.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';

import 'add_today_sales.dart';

class TodaySalesManagement extends StatelessWidget {
   TodaySalesManagement({super.key});

  final _key = GlobalKey<ExpandableFabState>();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.textWhite,
          leading: IconButton(
              onPressed: ()=>Get.back(),
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



          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: ExpandableFab(
            key: _key,
            type: ExpandableFabType.up,
            overlayStyle: ExpandableFabOverlayStyle(
              color: Colors.black.withOpacity(0.5),
              blur: 5,
            ),
            onOpen: () {
              debugPrint('onOpen');
            },
            afterOpen: () {
              debugPrint('afterOpen');
            },
            onClose: () {
              debugPrint('onClose');
            },
            afterClose: () {
              debugPrint('afterClose');
            },
            children: [
              FloatingActionButton.extended(
                heroTag: null,
                icon: const Icon(Icons.add),
                onPressed: (){
                  print("page name: ${AppRoute.addTodaySalesScreen}");
                  Get.toNamed(AppRoute.addTodaySalesScreen);
                },
                label: Text("Add today sales"),
              ),
              FloatingActionButton.extended(
                heroTag: null,
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialrialPageRoute(builder: ((context) => const NextPage())));
                },
                label: Text("Add today cost"),
              ),
              FloatingActionButton.extended(
                heroTag: null,
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialrialPageRoute(builder: ((context) => const NextPage())));
                },
                label: Text("Add Food Cost"),
              ),
            ],
          )

          ),
    );
  }
}
