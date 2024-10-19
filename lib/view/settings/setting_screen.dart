import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/settings/screen/tax_and_state.dart';
import 'package:abs_office_management/view/settings/widget/option_box.dart';
import 'package:abs_office_management/view/settings/widget/setting_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_color.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.toNamed(AppRoute.dashBoard), icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        title:const Text("Setting ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor:Colors.transparent ,
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OptionBox(
                title: "Account Setting",
                column: [
                  SettingOptions(name: "Business Setup", icon: Icons.add_business_sharp, onClick: (){}),
                  const Divider(),
                  SettingOptions(name: "Password", icon: Icons.key, onClick: (){}),

                ]),
            const SizedBox(height: 20,),
            OptionBox(
                title: "General Setting",
                column: [
                  SettingOptions(name: "Tax & State", icon: Icons.bar_chart, onClick: ()=>Get.to(()=>TaxAndState())),
                  const Divider(),
                  SettingOptions(name: "Online sells platform", icon: Icons.online_prediction, onClick: (){}),
                  const Divider(),
                  SettingOptions(name: "Employee Position", icon: Icons.people, onClick: (){}),

                  const Divider(),
                  SettingOptions(name: "Credit card processing fee", icon: Icons.credit_card, onClick: (){}),

                ]),

            const SizedBox(height: 20,),
            OptionBox(
                title: "Legal",
                column: [
                  SettingOptions(name: "Privacy Policy", icon: Icons.privacy_tip, onClick: (){}),
                  const Divider(),
                  SettingOptions(name: "Terms & Conditions", icon: Icons.contact_support, onClick: (){}),
                  const Divider(),
                  SettingOptions(name: "Support", icon: Icons.wifi_calling_sharp, onClick: (){}),

                ]),

            const SizedBox(height: 20,),
            ListTile(
              contentPadding:const EdgeInsets.only(left: 10),
              onTap: ()=>Get.toNamed(AppRoute.login),
              leading: const Icon(Icons.logout,color: AppColors.red,),
              title:const Text("Logout",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.red),),
            ),
          ],
        ),
      ),
    ));
  }
}
