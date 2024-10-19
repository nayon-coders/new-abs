import 'package:abs_office_management/utility/assetes.dart';
import 'package:abs_office_management/view/dash_board_screen/widget/drawer_menu.dart';
import 'package:abs_office_management/view/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';


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
          DrawerMenu(icon: Icons.home, name: "Home", onClick: (){}),
          DrawerMenu(icon: Icons.monetization_on, name: "Today Sales Management", onClick: (){}),
          DrawerMenu(icon: Icons.bar_chart, name: "Loss & Profit", onClick: (){}),
          DrawerMenu(icon: Icons.person, name: "Employee Management", onClick: (){}),
          DrawerMenu(icon: Icons.wallet, name: "Salary Management", onClick: (){}),
          DrawerMenu(icon: Icons.people, name: "Partner controller", onClick: (){}),
          DrawerMenu(icon: Icons.miscellaneous_services, name: "Services", onClick: (){}),
          DrawerMenu(icon: Icons.privacy_tip_outlined, name: "My Privileges", onClick: (){}),
          DrawerMenu(icon: Icons.settings, name: "Setting", onClick: ()=>Get.to(()=>SettingScreen())),
        ],
      ),
    );
  }
}
