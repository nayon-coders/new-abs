import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/auth/controller/auth_controller.dart';
import 'package:abs_office_management/view/auth/widget/back_button.dart';
import 'package:abs_office_management/view/auth/widget/title_text.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_color.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  final _userName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _businessName = TextEditingController();
  final _businessAddress = TextEditingController();
 // final _conformPass = TextEditingController();
  final _key = GlobalKey<FormState>();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
       // backgroundColor: AppColors.bgColor,

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
                    child: LeadingButton(onClick: ()=>Get.back())
                ),

               const SizedBox(height: 20,),
               const TitleText(text: "Hello! Register to get started"),
               const SizedBox(height: 20,),

                AppInput(
                    hint: "User Name",
                    controller: _userName,
                  textType: TextInputType.name,
                ),

                const SizedBox(height: 15,),
                AppInput(
                  hint: "Business Name",
                  controller: _businessName,
                  textType: TextInputType.name,
                ),
                const SizedBox(height: 15,),
                AppInput(
                  hint: "Business Address",
                  controller: _businessAddress,
                  textType: TextInputType.name,
                ),
                const SizedBox(height: 15,),

                AppInput(
                  hint: "Email",
                  controller: _email,
                  textType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 15,),
                AppInput(
                  hint: "Phone",
                  controller: _phone,
                  textType: TextInputType.number,
                ),

                const SizedBox(height: 15,),

                AppInput(
                    hint: "password",
                    controller: _password,
                  textType: TextInputType.visiblePassword,
                ),
                //const SizedBox(height: 15,),

                // AppInput(
                //   hint: "Conform password",
                //   controller: _conformPass,
                //   textType: TextInputType.visiblePassword,
                // ),

               const SizedBox(height: 30,),
                Obx((){
                    return AppButton(
                      isLoading: controller.isLoading.value,
                      width: double.infinity,
                        name: "Register",
                        onClick: ()async{
                        if(_key.currentState!.validate()){
                          controller.signUp(
                              name: _userName.text,
                              businessName: _businessName.text,
                              businessAddress: _businessAddress.text,
                              email: _email.text,
                              phone: _phone.text,
                              password: _password.text,
                          );
                        }

                        },
                    );
                  }
                ),
                SizedBox(height: size.height*0.20,),
                Center(
                  child: InkWell(
                    onTap: ()=>Get.toNamed(RouteName.login),
                    child: RichText(
                      text:const TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),
                          children: [
                            TextSpan(
                                text: " Login Now",
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.linkColor)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
