import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:abs_office_management/view/employee_management/screen/employee_management.dart';
import 'package:abs_office_management/view/loss_profit/loss_profit.dart';
import 'package:abs_office_management/view/partner_management/partner_management.dart';
import 'package:abs_office_management/view/salery_management/salary_management.dart';
import 'package:abs_office_management/view/today_sales_management/today_sales_management.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/dash_box.dart';
import 'widget/drawer.dart';
import 'widget/menu_box.dart';

class DashBoardScreen extends StatelessWidget {
   DashBoardScreen({super.key});
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
    drawer: const CustomDrawer(),
    appBar: AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      backgroundColor: Colors.white,

      title:const Text("Dashboard",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.textindico,
        ),
      ),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: ()=>Get.toNamed(AppRoute.setting),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(child: Image.asset(Assets.logo,height: 40,width: 40,fit: BoxFit.cover,)),
          ),
        ),
       const SizedBox(width: 10,),
      ],
      bottom: PreferredSize(
          preferredSize:const Size.fromHeight(80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                child: AppInput(
                  circuler: 35,
                    hint: "Search",
                    controller: _search),
              ),
             const SizedBox(height: 20,),
            ],
          )),


    ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: dashbox.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 2
                ), itemBuilder: (context,index){
              final item = dashbox[index];
                  return DashBox(
                    onClick:item["screen"],
                      costName: item["costName"],
                      costAmount: item["costAmount"],
                      image:item["image"],
                      bgColor:item["color"],
                  );
            }),
            const SizedBox(height: 20,),

           const Text("Menu",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textindico),
           ),
            const SizedBox(height: 15,),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: menubox.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 150
                ), itemBuilder: (context,index){
                final data = menubox[index];
                return MenuBox(
                    name: data["name"],
                    image: data["image"],
                    onClick:()=>Get.to(data["screen"]),
                );
            })

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

   ///--------dashbox Menu --------
   ///
   List<Map<String,dynamic>> menubox=[
     {"name": "Today Sales Manage","image": Assets.todaysale,"screen": TodaySalesManagement()},
     {"name": "Loss & Profit","image": Assets.loss,"screen": LossProfit()},
     {"name": "Employee Manage","image": Assets.employee,"screen": EmployeeManagement()},
     {"name": "Salary Manage","image": Assets.salery,"screen": SalaryManagement()},
     {"name": "Partner Manage","image": Assets.partner,"screen": PartnerManagement()},

   ];
}
