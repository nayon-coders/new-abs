import 'package:abs_office_management/controller/date_time_controller.dart';
import 'package:abs_office_management/controller/role_managment_controller.dart';
import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:abs_office_management/view/loss_profit/controller/lossProfit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../widgets/app_shimmer.dart';
import 'widget/dash_box.dart';
import 'widget/drawer.dart';
import 'widget/menu_box.dart';

class DashBoardScreen extends StatelessWidget {
   DashBoardScreen({super.key});
  final DateTimeController dateTimeController = Get.put(DateTimeController());
   final LossProfitController lossProfitController = Get.find<LossProfitController>();
   final RoleManagmentController roleController = Get.find<RoleManagmentController>();



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
              Obx(() {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: roleController.isPartner.value ? Colors.indigo : AppColors.mainColor,
                    ),
                    child:  Center(
                      child: Text("Welcome - ${roleController.role.value}",
                        style:const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                  );
                }
              ),
             const SizedBox(height: 20,),
            ],
          )),


    ),
      body: RefreshIndicator(
        onRefresh: lossProfitController.refreshData,
        child: SingleChildScrollView(
          padding:const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                if(lossProfitController.isLoading.value){
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
      ),
    );
  }



  //dashbox Menu
   List<Map<String,dynamic>> get dashbox=>[
     {"costName": "Total Sales","costAmount":lossProfitController.totalSalesAmount.value??"", "image": Assets.money,"color":const Color(0xFFFFF5D9), "screen": (){}},
     {"costName": "Net Sales", "costAmount":lossProfitController.netSales.value??"","image": Assets.income,"color":const Color(0xFFE7EDFF), "screen": (){}},
     {"costName": "Expense", "costAmount":lossProfitController.lossProfitModel.value.totalDabit ?? "","image": Assets.expance,"color":const Color(0xFFFFE0EB), "screen": (){}},
     {"costName": "Online Sales", "costAmount":lossProfitController.lossProfitModel.value.toatlOnlineSales??"","image": Assets.sells,"color":const Color(0xFFDCFAF8), "screen": (){}},

   ];

   ///--------dashbox Menu --------
   ///
   List<Map<String,dynamic>> menubox=[
     {"name": "Today Sales Manage","image": Assets.todaysale,"screen": "${AppRoute.salesManageScree}"},
     {"name": "Loss & Profit","image": Assets.loss,"screen": "${AppRoute.lossProfit}"},
     {"name": "Employee Manage","image": Assets.employee,"screen": "${AppRoute.employeeManageScree}"},
     {"name": "Salary Manage","image": Assets.salery,"screen": "${AppRoute.salaryManagementScree}"},
     {"name": "Partner Manage","image": Assets.partner,"screen": "${AppRoute.partnerManagementScreen}"},
     {"name": "Year & Month","image": Assets.year,"screen": "${AppRoute.yearMonth}"},

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