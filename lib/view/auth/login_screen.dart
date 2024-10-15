import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/routes/route_page.dart';
import 'package:abs_office_management/view/auth/widget/back_button.dart';
import 'package:abs_office_management/view/auth/widget/title_text.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_color.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final _email = TextEditingController();
  final _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      //backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

           Align(
             alignment: Alignment.topLeft,
               child: LeadingButton(onClick: ()=>Get.offNamed(RouteName.welcome))),
           const SizedBox(height: 30,),

          const TitleText(text: "Welcome back! Glad to see you, Again!"),
            const SizedBox(height: 20,),



            //Email
            AppInput(
                hint: "Enter your Email",
                textType: TextInputType.emailAddress,
                controller: _email),
           const SizedBox(height: 15,),

            //Enter password
            AppInput(
                hint: "Enter your Password",
                textType: TextInputType.visiblePassword,
                controller: _password,
              suffixIcon:const Icon(Icons.visibility,color: AppColors.textBlack,),
            ),
           const SizedBox(height: 10,),

            //forgot password
            Align(
              alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: ()=>Get.toNamed(RouteName.forgotEmail),
                    child:const Text("Forgot Password?",
                      style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:AppColors.linkColor),
                    ),
                ),
            ),

            const SizedBox(height: 40,),

            AppButton(
              width: double.infinity,
                name: "Login",
                onClick: (){}
            ),



            SizedBox(height: size.height*0.30,),
            Center(
              child: InkWell(
                onTap: ()=>Get.toNamed(RouteName.register),
                child: RichText(
                  text:const TextSpan(
                    text: "Don’t have an account?",
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),
                    children: [
                      TextSpan(
                        text: " Register Now",
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
