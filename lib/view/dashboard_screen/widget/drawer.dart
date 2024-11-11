import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';
import 'drawer_menu.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: AppColors.textWhite,
      width: 300,
      child: Column(
        children: [
          Image.asset(Assets.logo,height: 120,width: 120,fit: BoxFit.contain,),
          const SizedBox(height: 20,),
          DrawerMenu(icon: Icons.home, name: "Home", onClick: ()=>Get.back()),
          DrawerMenu(icon: Icons.monetization_on, name: "Today Sales Management", onClick: ()=>Get.toNamed(AppRoute.salesManageScree)),
          DrawerMenu(icon: Icons.bar_chart, name: "Loss & Profit", onClick: ()=>Get.toNamed(AppRoute.lossProfit)),
          DrawerMenu(icon: Icons.person, name: "Employee Management", onClick: ()=>Get.toNamed(AppRoute.employeeManageScree)),
          DrawerMenu(icon: Icons.wallet, name: "Salary Management", onClick: ()=>Get.toNamed(AppRoute.salaryManagementScree)),
          DrawerMenu(icon: Icons.people, name: "Partner controller", onClick: ()=>Get.toNamed(AppRoute.partnerManagementScreen)),
          DrawerMenu(icon: Icons.settings, name: "Setting", onClick: ()=>Get.toNamed(AppRoute.setting)),
        ],
      ),
    );
  }
}
