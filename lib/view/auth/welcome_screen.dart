import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(const Duration(seconds: 3),()=>Get.toNamed(AppRoute.login));
    //check user is login or not with future delay


  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Container(
        alignment: Alignment.center,
        width: Get.width,
        height: Get.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
               Image.asset(Assets.welcome2, height: Get.height*.45, width: Get.width, fit: BoxFit.cover,),

              Image.asset(Assets.logo,height: 150,width: 150,fit: BoxFit.contain,),

             const Text("All Business Solution",
               style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   color: AppColors.textBlack),
             ),

             const SizedBox(height: 30,),
              AppButton(
                  name: "Login",
                  width: 300,
                  onClick: ()=>Get.toNamed(AppRoute.login),
              ),
              const SizedBox(height: 10,),


              InkWell(
                onTap: ()=>Get.toNamed(AppRoute.register),
                child: Container(
                  height: 45,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color:Colors.white,
                    border: Border.all(color: Colors.grey),
                  ),
                  child:const Center(
                    child: Text("Register",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.textBlack,
                      ),
                    ),
                  ),
                ),
              ),

              Spacer(),

             //  InkWell(
             //    onTap: ()=>Get.to(()=>DashBoardScreen()),
             //      child:const Text("Continue as a guest",
             //        style: TextStyle(fontSize: 14,
             //            fontWeight: FontWeight.w600,
             //            color: AppColors.linkColor),
             //      ),
             //  ),
             // const SizedBox(height: 40,),
             //

            ],
          ),
        ),

      ),
    );
  }
}
