import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/auth/forgot_password/forgot_controller/forgot_controller.dart';
import 'package:abs_office_management/view/auth/widget/back_button.dart';
import 'package:abs_office_management/view/auth/widget/title_text.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePassword extends GetView<ForgotController> {
  CreatePassword({super.key});
  final newPassword = TextEditingController();
  final confPassword = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //get email & otp form otp screen
    final Map<String,dynamic> arg = Get.arguments;
    final String email = arg["email"];
    final String otp = arg["otp"];
    print("argument otp-------$email----------");
    print("argument otp-------$otp----------");
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                const  TitleText(text: "Create new password"),
                const SizedBox(height: 10,),
                const SizedBox(
                  width: 300,
                  child: Text("Your new password must be unique from those previously used.",style: TextStyle(
                    fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textGrey,
                  ),
                  ),
                ),
                const SizedBox(height: 30,),
                AppInput(
                  hint: "New Password",
                  controller: newPassword,
                  textType: TextInputType.visiblePassword,
                ),
               const SizedBox(height: 15,),
                AppInput(
                  hint: "Conform Password",
                  controller: confPassword,
                  textType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 30,),
                Obx(() {
                    return AppButton(
                      width:double.infinity,
                      isLoading: controller.isLoading.value,
                      name: "Reset Password",
                      onClick: ()async{

                            if(newPassword.text == confPassword.text){
                              controller.createNewPassword(
                                email,
                                otp,
                                newPassword.text,
                              );
                            }else{
                              Get.snackbar("Failed", "Passwords do not match",backgroundColor: Colors.red);
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
