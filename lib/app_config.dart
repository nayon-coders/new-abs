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

  //Admin Password Update
  static const String SINGLE_ADMIN_PASS_CHANGE = "$BASE_URL/employee/new-admin/update-password/";//PUT ID



  //EMPLOYEE POSITION
  static const String CREATE_POSITION = "$BASE_URL/position/create"; //POST
  static const String GET_POSITION = "$BASE_URL/position/all"; //GET
  static const String UPDATE_POSITION = "$BASE_URL/position/update/"; //PUT
  static const String DELETE_POSITION = "$BASE_URL/position/delete/"; //DELETE PASS ID



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


  //Contact & Support
  static const String CONTACT_EMAIL_PHONE = "$BASE_URL/contact-support";


  //credit card processing
  static const String UPDATE_CREDIT_CARD_PROCESSING = "$BASE_URL/processign-fee/update"; //PUT
  static const String GET_CREDIT_CARD_PROCESSING = "$BASE_URL/processign-fee/"; //GET


  //TODAY SALES
  static const String TODAY_SALES = "$BASE_URL/sales/all"; //GET
  static const String TODAY_SALES_CREATE = "$BASE_URL/sales/create"; //POST
  static const String TODAY_SALES_UPDATE = "$BASE_URL/sales/update/"; //PUT
  static const String TODAY_SALES_DELETE = "$BASE_URL/sales/delete/"; //DELETE





}