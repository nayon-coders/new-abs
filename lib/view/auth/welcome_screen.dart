import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:abs_office_management/view/auth/login_screen.dart';
import 'package:abs_office_management/view/dash_board_screen/dash_board_screen.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          width: Get.width,
          height: Get.height,
          decoration:const BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.welcome),fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height:size.height*0.42,),

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
                    onClick: ()=>Get.toNamed(RouteName.login),
                ),
                const SizedBox(height: 10,),


                InkWell(
                  onTap: ()=>Get.toNamed(RouteName.register),
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

                InkWell(
                  onTap: ()=>Get.to(()=>DashBoardScreen()),
                    child:const Text("Continue as a guest",
                      style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.linkColor),
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
