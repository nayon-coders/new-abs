import 'package:abs_office_management/data/binding/loss_profit_binding.dart';
import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:abs_office_management/view/loss_profit/controller/lossProfit_controller.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../widgets/app_shimmer.dart';
import 'widget/dash_box.dart';
import 'widget/drawer.dart';
import 'widget/menu_box.dart';

class DashBoardScreen extends StatelessWidget {
   DashBoardScreen({super.key});
  final _search = TextEditingController();
   final LossProfitController controller = Get.put(LossProfitController());

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
            Obx(() {
              if(controller.isLoading.value){
                return GridView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 2
                    ),
                    itemBuilder: (context,index){
                  return AppShimmerPro.circularShimmer(width: 150, height: 100, borderRadius: 10);
                });
              }else{
                return GridView.builder(
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
                    costAmount: item["costAmount"].toString(),
                    image:item["image"],
                    bgColor:item["color"],
                  );
                }).animate().fadeIn(duration:500.ms);
              }

              }
            ),
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
                    onClick:()=>Get.toNamed(data["screen"]),
                );
            })

          ].animate(interval: 150.ms).fade(duration: 300.ms),
        ),
      ),
    );
  }



  //dashbox Menu
   List<Map<String,dynamic>> get dashbox=>[
     {"costName": "Total Sales","costAmount":controller.lossProfitModel.value.totalSales??"", "image": Assets.money,"color":const Color(0xFFFFF5D9), "screen": (){}},
     {"costName": "Net Income", "costAmount":controller.lossProfitModel.value.netIncome??"","image": Assets.income,"color":const Color(0xFFE7EDFF), "screen": (){}},
     {"costName": "Expense", "costAmount":controller.lossProfitModel.value.totalDabit??"","image": Assets.expance,"color":const Color(0xFFFFE0EB), "screen": (){}},
     {"costName": "Online Sales", "costAmount":controller.lossProfitModel.value.toatlOnlineSales??"","image": Assets.sells,"color":const Color(0xFFDCFAF8), "screen": (){}},

   ];

   ///--------dashbox Menu --------
   ///
   List<Map<String,dynamic>> menubox=[
     {"name": "Today Sales Manage","image": Assets.todaysale,"screen": "${AppRoute.salesManageScree}"},
     {"name": "Loss & Profit","image": Assets.loss,"screen": "${AppRoute.lossProfit}"},
     {"name": "Employee Manage","image": Assets.employee,"screen": "${AppRoute.employeeManageScree}"},
     {"name": "Salary Manage","image": Assets.salery,"screen": "${AppRoute.salaryManagementScree}"},
     {"name": "Partner Manage","image": Assets.partner,"screen": "${AppRoute.partnerManagementScreen}"},

   ];
}


Widget _buildLoading() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 10,
    itemBuilder: (context,index){
      return AppShimmerPro.circularShimmer(width: 100, height: 100, borderRadius: 10);
    },
  );
}