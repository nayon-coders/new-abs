import 'package:abs_office_management/data/binding/employee_binding.dart';
import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/auth/login_screen.dart';
import 'package:abs_office_management/view/auth/register_screen.dart';
import 'package:abs_office_management/view/auth/welcome_screen.dart';
import 'package:abs_office_management/view/employee_management/screen/add_employee.dart';
import 'package:abs_office_management/view/employee_management/screen/employee_management.dart';
import 'package:abs_office_management/view/employee_management/screen/single_employee.dart';
import 'package:abs_office_management/view/loss_profit/loss_profit.dart';
import 'package:abs_office_management/view/partner_management/partner_management.dart';
import 'package:abs_office_management/view/salery_management/salary_management.dart';
import 'package:abs_office_management/view/settings/screen/add_employee_position_view.dart';
import 'package:abs_office_management/view/settings/screen/business_setup.dart';
import 'package:abs_office_management/view/settings/screen/change_password.dart';
import 'package:abs_office_management/view/settings/screen/creditcard_processing_fee.dart';
import 'package:abs_office_management/view/settings/screen/tax_and_state.dart';
import 'package:abs_office_management/view/settings/setting_screen.dart';
import 'package:abs_office_management/view/today_sales_management/today_sales_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/binding/setting.binding.dart';
import '../data/middleware/auth_middleware.dart';
import '../view/auth/forgot_password/forgot_screen.dart';
import '../view/dashboard_screen/dash_board_screen.dart';
import '../view/settings/screen/online.sales.platform.dart';

class RoutePage{
  static List<GetPage<dynamic>> routes=[
    GetPage(
        name: AppRoute.welcome,
        page: ()=>const WelcomeScreen(),
      middlewares: [AuthMiddleware()]
    ),

    GetPage(
        name: AppRoute.login,
        page: ()=> LoginScreen(),
        middlewares: [AuthMiddleware()]
    ),

    GetPage(
      name: AppRoute.register,
      page: ()=>  RegisterScreen(),
    ),
    GetPage(
      name: AppRoute.forgotEmail,
      page: ()=>  ForgotScreen(),
    ),
    GetPage(
      name: AppRoute.dashBoard,
      page: ()=>  DashBoardScreen(),
    ),

    GetPage(
      name: AppRoute.setting,
      page: ()=>  SettingScreen(),
    ),

    GetPage(
        name: AppRoute.textAndState,
        page: ()=>  TaxAndState(),
        binding: SettingBinding()
    ),

    GetPage(
      name: AppRoute.onlineSellPlatform,
      page: ()=>  OnlineSalesPlatform(),
      binding: SettingBinding()
    ),

    GetPage(
        name: AppRoute.employeePosition,
        page: ()=>  AddEmployeePositionView(),
        binding: SettingBinding()
    ),

    GetPage(
        name: AppRoute.creditCard,
        page: ()=>  CreditcardProcessingFee(),
        binding: SettingBinding()
    ),
    GetPage(
        name: AppRoute.adminPassword,
        page: ()=> ChangePassword(),
        binding: SettingBinding()
    ),
    GetPage(
        name: AppRoute.businessSetup,
        page: ()=> BusinessSetup(),
        binding: SettingBinding()
    ),

    //Employee Management
    GetPage(
        name: AppRoute.employeeMange,
        page: ()=>EmployeeManagement(),
      binding: EmployeeBinding(),
    ),

    GetPage(
      name: AppRoute.addEmployee,
      page: ()=>AddEmployee(),
      binding: EmployeeBinding(),
    ),
    GetPage(
      name: AppRoute.singleEmployee,
      page: ()=>SingleEmployee(),
      binding: EmployeeBinding(),
    ),


    GetPage(name: AppRoute.lossProfit,
        page: ()=>LossProfit()
    ),

    GetPage(name: AppRoute.salaryManagement,
        page: ()=>SalaryManagement(),
    ),

    GetPage(name: AppRoute.todaySalesManagement, page: ()=>TodaySalesManagement()),
    GetPage(name: AppRoute.partnerManagement, page: ()=>PartnerManagement()),


  ];
}