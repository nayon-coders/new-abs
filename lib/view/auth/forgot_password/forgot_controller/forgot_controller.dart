import 'dart:convert';
import 'package:abs_office_management/view/auth/forgot_password/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_config.dart';
import '../../../../controller/api_controller.dart';
import '../../../../routes/route_name.dart';
import '../create_password.dart';
import '../otp_screen.dart';

class ForgotController extends GetxController{
  RxBool isLoading = false.obs;



  ///------forgot password----

  //send otp verify email
  Future<void> sendOtp(String email)async{
    isLoading.value = true;
    try{
      final res = await ApiController.postApi(
          URL:AppConfig.SEND_OTP,
          body: {"email":email}
      );
      if(res.statusCode ==200){
        print("otp send success");
        Get.snackbar("Success", "Send OTP in your verify Email",
            backgroundColor: Colors.green,
            colorText: Colors.white
        );
        Get.to(
          OtpScreen(),
          arguments: email,
        );

      }else{
        print("OTP send Failed ${jsonDecode(res.body)["message"]}");
        Get.snackbar("Failed", "OTP send Failed ${jsonDecode(res.body)["message"]}");
      }
    }catch(e){
      print(e);
    }finally{
      isLoading.value = false;
    }

  }

  //check otp
  Future<void> verifyOtp(String email, String otp)async{
    isLoading.value = true;
    try{
      final res = await ApiController.postApi(
          URL: AppConfig.VERIFY_OTP,
          body: {
            "email":email,
            "resetCode":otp,
          });
      if(res.statusCode == 200){
        print("OTP verify Successful");
        Get.snackbar("Success", "OPT Verify Successful",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.to(
            CreatePassword(),
            arguments: {
              "email":email,
              "otp":otp,
            }
        );

      }else{
        print("OTP verify failed");
        Get.snackbar("Failed", "OTP verify failed",backgroundColor: Colors.red,colorText: Colors.white);
      }
    }catch(e){print(e);
    }finally{
      isLoading.value = false;
    }

  }



  //Add new password
  Future<void> createNewPassword(String email,String otp,String password)async{
    isLoading.value = true;
    try{
      final res = await ApiController.postApi(
          URL: AppConfig.SET_NEW_PASSWORD,
          body: {
            "email":email,
            "resetCode":otp,
            "newPassword":password,

          });
      if(res.statusCode == 200){
        print("set password success");
        Get.snackbar("Successful", "Set new Password success");
        Get.to(SuccessScreen());
      }else{
        print("Set password Failed");
        Get.snackbar("Failed", "Set new password failed",colorText: Colors.white,backgroundColor: Colors.green);
      }
    }catch(e){print(e);
    }finally{
      isLoading.value = false;
    }
  }



}