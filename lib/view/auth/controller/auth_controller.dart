import 'dart:convert';

import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/controller/api_controller.dart';
import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/auth/forgot_password/create_password.dart';
import 'package:abs_office_management/view/auth/forgot_password/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utility/app_const.dart';

class AuthController extends GetxController{

  RxBool isLoading = false.obs;

  //login
  Future<void> login({required String email,required String password})async{

    isLoading.value = true;
    try{
      SharedPreferences _pref = await SharedPreferences.getInstance();

      final res =await ApiController.postApi(
          URL: AppConfig.ADMIN_LOGIN,
          body: {
            "email":email,
            "password":password,
          });
      if(res.statusCode ==200){
        try{
          final data = jsonDecode(res.body);

          if(data["data"]["user"]["type"] == adminRole ||
              data["data"]["user"]["type"] == managerRole ||
              data["data"]["user"]["type"] == partner){
            Get.snackbar("Success", "Login Successful",backgroundColor: Colors.green,colorText: Colors.white);

            //set token
            _pref.setString("token", data["data"]["token"]);
            _pref.setString("role", data["data"]["user"]["type"]);
            _pref.setString("id", data["data"]["user"]["id"].toString());
            _pref.setString("business_id", data["data"]["user"]["business_id"].toString());

            Get.offNamed(AppRoute.dashBoard);
          }else{
            Get.snackbar("Failed", "Sorry! You are not allowed to login here.",backgroundColor: Colors.red,colorText: Colors.white);
          }
        }catch(jsonError){
          print("JSON parse error: $jsonError");
          Get.snackbar("Login Failed", "Invalid server response",backgroundColor: Colors.red);
        }

      }else{
        //handel non-200 response
        try{
          final errorData = jsonDecode(res.body);
          Get.snackbar(" error", "${errorData["error"]}",backgroundColor: Colors.red);
        }catch(e){
          print("Json parse error in error response:${e}");

        }
      }
    }catch(e){
      print(e);
    }finally{
      isLoading.value = false;
    }

  }

  //SIGN_UP
  Future<void> signUp({
    required String name,
    required String businessName,
    required String businessAddress,
    required String email,
    required String phone,
    required String password,
})async{

    isLoading.value = true;
    try{
      SharedPreferences _pref = await SharedPreferences.getInstance();

      final res = await ApiController.postApi(
          URL: AppConfig.ADMIN_SIGNUP,
          body:{
            "name":name,
            "business_name":businessName,
            "business_address":businessAddress,
            "email":email,
            "phone":phone,
            "password":password,
          });
      final body = jsonDecode(res.body);
      if(res.statusCode ==200){
        print("Sign up successful");

        //save token
        String token = body["data"]["token"];
        _pref.setString("token", token);

        Get.snackbar("Successful", body["message"],backgroundColor: Colors.green,colorText: Colors.white);

        Get.offNamed(AppRoute.login);
      }else{
        print("admin signup failed");
        Get.snackbar("Failed",body["message"],backgroundColor: Colors.red,colorText: Colors.black);
      }
    }catch(e){
      print(e);
    }finally{
      isLoading.value=false;
    }

}









}