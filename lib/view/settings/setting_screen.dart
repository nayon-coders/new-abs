import 'package:abs_office_management/main.dart';
import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_const.dart';
import 'package:abs_office_management/view/settings/screen/contact_and_support_screen.dart';
import 'package:abs_office_management/view/settings/screen/privacy_policy.dart';
import 'package:abs_office_management/view/settings/screen/terms_condition.dart';
import 'package:abs_office_management/view/settings/widget/option_box.dart';
import 'package:abs_office_management/view/settings/widget/setting_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/role_managment_controller.dart';
import '../../utility/app_color.dart';

class SettingScreen extends StatelessWidget {
    SettingScreen({super.key});


   final RoleManagmentController roleController = Get.find<RoleManagmentController>();


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
                title: "Profile Setting",
                column: [

                      SettingOptions(name: "Business Setup", icon: Icons.add_business_sharp, onClick: ()=>Get.toNamed(AppRoute.businessSetup)),


                 const Divider(),


                  SettingOptions(name: "Change Password", icon: Icons.key, onClick: ()=>Get.toNamed(AppRoute.adminPassword)),

                ]),
            roleController.isPartner.value ? const Center() :  const SizedBox(height: 20,),
             roleController.isPartner.value ? const Center() : OptionBox(
                title: "General Setting",
                column: [
                  SettingOptions(name: "Tax & State", icon: Icons.bar_chart, onClick: ()=>Get.toNamed(AppRoute.textAndState)),
                  const Divider(),
                  SettingOptions(name: "Online sells platform", icon: Icons.online_prediction, onClick: ()=> Get.toNamed(AppRoute.onlineSellPlatform)),
                  const Divider(),
                  SettingOptions(name: "Employee Position", icon: Icons.people, onClick: ()=>Get.toNamed(AppRoute.employeePosition)),

                  const Divider(),
                  SettingOptions(name: "Credit card processing fee", icon: Icons.credit_card, onClick:()=>Get.toNamed(AppRoute.creditCard)),

                ]),

            const SizedBox(height: 20,),
            OptionBox(
                title: "Legal",
                column: [
                  SettingOptions(name: "Privacy Policy", icon: Icons.privacy_tip, onClick: ()=>Get.to(()=>const PrivacyPolicy())),
                  const Divider(),
                  SettingOptions(name: "Terms & Conditions", icon: Icons.contact_support, onClick: ()=>Get.to(const TermsCondition())),
                  const Divider(),
                  SettingOptions(name: "Contact & Support", icon: Icons.support_agent, onClick: ()=>Get.to(()=>const ContactSupport())),


                ]),

            const SizedBox(height: 20,),
            ListTile(
              contentPadding:const EdgeInsets.only(left: 10),
              onTap: ()=> alertDialog(
                    title: "Hold On !",
                    content: "Are you sure? Do you want to Logout?",
                    onOk: ()async{
                      await sharedPreferences!.clear().then((e){
                        Get.snackbar("Successful", "Logout successful",backgroundColor: Colors.green,colorText: Colors.white
                        );
                        Get.offAllNamed(AppRoute.login);
                      });


                    },
                ),
              leading: const Icon(Icons.logout,color: AppColors.red,),
              title:const Text("Logout",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.red),),
            ),
          ],
        ),
      ),
    );
  }
}
