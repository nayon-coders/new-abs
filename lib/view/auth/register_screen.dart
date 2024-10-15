import 'package:abs_office_management/routes/route_name.dart';
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
  final _password = TextEditingController();
  final _conformPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
     // backgroundColor: AppColors.bgColor,
      
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
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
              hint: "Email",
              controller: _email,
              textType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 15,),

            AppInput(
                hint: "password",
                controller: _password,
              textType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 15,),

            AppInput(
              hint: "Conform password",
              controller: _conformPass,
              textType: TextInputType.visiblePassword,
            ),

           const SizedBox(height: 30,),
            AppButton(
              width: double.infinity,
                name: "Register",
                onClick: (){},
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

    );
  }
}
