import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/settings/screen/add_employee_position_view.dart';
import 'package:abs_office_management/view/settings/screen/business_setup.dart';
import 'package:abs_office_management/view/settings/screen/change_password.dart';
import 'package:abs_office_management/view/settings/screen/creditcard_processing_fee.dart';
import 'package:abs_office_management/view/settings/screen/privacy_policy.dart';
import 'package:abs_office_management/view/settings/screen/tax_and_state.dart';
import 'package:abs_office_management/view/settings/screen/terms_condition.dart';
import 'package:abs_office_management/view/settings/widget/option_box.dart';
import 'package:abs_office_management/view/settings/widget/setting_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_color.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SettingOptions(name: "Business Setup", icon: Icons.add_business_sharp, onClick: ()=>Get.to(()=>BusinessSetup())),
                  const Divider(),
                  SettingOptions(name: "Change Password", icon: Icons.key, onClick: ()=>Get.to(()=>ChangePassword())),

                ]),
            const SizedBox(height: 20,),
            OptionBox(
                title: "General Setting",
                column: [
                  SettingOptions(name: "Tax & State", icon: Icons.bar_chart, onClick: ()=>Get.toNamed(AppRoute.textAndState)),
                  const Divider(),
                  SettingOptions(name: "Online sells platform", icon: Icons.online_prediction, onClick: ()=> Get.toNamed(AppRoute.onlineSellPlatform)),
                  const Divider(),
                  SettingOptions(name: "Employee Position", icon: Icons.people, onClick: ()=>Get.to(()=>AddEmployeePositionView())),

                  const Divider(),
                  SettingOptions(name: "Credit card processing fee", icon: Icons.credit_card, onClick: ()=>Get.to(()=>CreditcardProcessingFee())),

                ]),

            const SizedBox(height: 20,),
            OptionBox(
                title: "Legal",
                column: [
                  SettingOptions(name: "Privacy Policy", icon: Icons.privacy_tip, onClick: ()=>Get.to(()=>PrivacyPolicy())),
                  const Divider(),
                  SettingOptions(name: "Terms & Conditions", icon: Icons.contact_support, onClick: ()=>Get.to(TermsCondition())),
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
    );
  }
}
