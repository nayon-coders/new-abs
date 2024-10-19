import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
   ChangePassword({super.key});
  final _currentPass = TextEditingController();
  final _newtPass = TextEditingController();
  final _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon:const  Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        title:const Text("Change Password",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(height: 20,),
            const Text("Current Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
                hint: "Current Password",
                fillColor: AppColors.textWhite,
                hintColor: AppColors.textindico,
                controller: _currentPass),

            const SizedBox(height: 20,),
            const Text("New Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),

            AppInput(
                hint: "New Password",
                fillColor: AppColors.textWhite,
                hintColor: AppColors.textindico,
                controller: _newtPass
            ),

            const SizedBox(height: 20,),
            const Text("Confirm Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),

            AppInput(hint: "Confirm Password",
                fillColor: AppColors.textWhite,
                hintColor: AppColors.textindico,
                controller: _currentPass,
            ),

            const SizedBox(height: 30,),
            Center(
              child: AppButton(
                  name: "Save",
                  onClick: (){},
              ),
            ),

            const SizedBox(height: 30,),



          ]
        ),
      ),
    );
  }
}
