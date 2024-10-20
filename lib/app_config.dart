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



  //EMPLOYEE


  //EMPLOYEE POSITION



  //EMPLOYEE LEAVE



  //EMPLOYEE ATTENDANCE


  // ONLINE SALES PLATFORM
  static const String ONLINE_SALES_PLATFORM = "$BASE_URL/online-platform/all"; //GET
  static const String ONLINE_SALES_PLATFORM_CREATE = "$BASE_URL/online-platform/create"; //POST
  static const String ONLINE_SALES_PLATFORM_UPDATE = "$BASE_URL/online-platform/update/"; //PUT
  static const String ONLINE_SALES_PLATFORM_DELETE = "$BASE_URL/online-platform/delete/"; //DELETE


  //TAX AND STATE
  static const String TAX_AND_STATE = "$BASE_URL/general-setting/all"; //GET
  static const String TAX_AND_STATE_UPDATE = "$BASE_URL/general-setting/update/"; //PUT
  static const String TAX_STATUS_CHECK = "$BASE_URL/general-setting/tax-status"; //PUT
  static const String TAX_STATUS_UPDATE = "$BASE_URL/general-setting/tax-status-change?status="; //PUT



}