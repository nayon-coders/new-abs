import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/auth/forgot_password/forgot_controller/forgot_controller.dart';
import 'package:abs_office_management/view/auth/forgot_password/otp_screen.dart';
import 'package:abs_office_management/view/auth/widget/back_button.dart';
import 'package:abs_office_management/view/auth/widget/title_text.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotScreen extends GetView<ForgotController> {
   ForgotScreen({super.key});
  final _email = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:const EdgeInsets.all(20),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                    child: LeadingButton(onClick: ()=>Get.offAllNamed(AppRoute.login),
                    ),
                ),
               const SizedBox(height: 30,),
               const  TitleText(text: "Forgot Password?"),
                const SizedBox(height: 10,),
               const SizedBox(
                  width: 300,
                  child: Text("Don't worry! It occurs. Please enter the email address linked with your account",style: TextStyle(
                    fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textGrey,
                  ),
                  ),
                ),
               const SizedBox(height: 30,),
                AppInput(
                    hint: "Email",
                    controller: _email,
                  textType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30,),
                Obx((){
                    return AppButton(
                      width:double.infinity,
                        name: "Send Code",
                        isLoading: controller.isLoading.value,
                        onClick: ()async{
                        if(_key.currentState!.validate()){
                          await controller.sendOtp(_email.text);
        
                        }
        
                        }
                    );
                  }
                ),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
