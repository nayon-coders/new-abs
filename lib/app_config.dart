import 'package:flutter/material.dart';

class AppConfig{
  //domain name
  static const String DOMAIN = "https://bms-api.allbusinesssolution.com";
  static const String API = "api/v1";
  static const String BASE_URL = "$DOMAIN/$API";

  //authentication
  static const String ADMIN_LOGIN = "$BASE_URL/employee/login"; //POST
  static const String ADMIN_SIGNUP = "$BASE_URL/employee/new-admin/create"; //POST

  //FORGOT PASSWORD
  static const String SEND_OTP ="$BASE_URL/users/forgot-password"; //POST
  static const String VERIFY_OTP ="$BASE_URL/users/verify-reset-cod"; //POST
  static const String SET_NEW_PASSWORD ="$BASE_URL/users/new-password"; //POST


}