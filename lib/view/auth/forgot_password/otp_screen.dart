import 'package:abs_office_management/view/auth/forgot_password/forgot_controller/forgot_controller.dart';
import 'package:abs_office_management/view/auth/forgot_password/forgot_screen.dart';
import 'package:abs_office_management/view/auth/widget/back_button.dart';
import 'package:abs_office_management/view/auth/widget/title_text.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../utility/app_color.dart';

class OtpScreen extends GetView<ForgotController> {
   OtpScreen({super.key});
  final _otpController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    String email = Get.arguments as String;
    print("argument email -------$email------");
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding:const EdgeInsets.all(20),
          child: Form(
            key: _key,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                    child: LeadingButton(onClick: ()=>Get.off(()=>ForgotScreen()),
                    ),
                ),
                const SizedBox(height: 20,),
               const TitleText(text: "OTP Verification"),
                const SizedBox(height: 10,),
                const SizedBox(
                  width: 300,
                  child: Text("Enter the verification code we just sent on your email address.",style: TextStyle(
                    fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textGrey,
                  ),
                  ),
                ),
                const SizedBox(height: 20,),
                Pinput(
                  controller: _otpController,
                  length: 6,
                  showCursor: true,
                  validator: (v){
                    if(v!.isEmpty){
                      return "Must be required";
                    }
                  },
                  onChanged: (pin)=>print("OTP Entered:$pin"),
                ),
                const SizedBox(height: 20,),
                AppButton(
                  width: double.infinity,
                    isLoading: controller.isLoading.value,
                    name: "Verify",
                    onClick: ()async{
                    if(_key.currentState!.validate()){
                      controller.verifyOtp(email, _otpController.text);
                    }
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
