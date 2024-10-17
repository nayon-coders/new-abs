import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/auth/widget/title_text.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Lottie.asset("assets/animation/success.json",height: 150,width: 150)),
               const SizedBox(height: 20,),
               const TitleText(text: "Password Changed!"),
               const SizedBox(
                  width: 250,
                  child: Text("Your password has been changed successfully.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textGrey),),
                ),
               const SizedBox(height: 30,),
                AppButton(
                  width: double.infinity,
                    name: "Back to Login",
                    onClick: ()=>Get.offNamed(RouteName.login),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
