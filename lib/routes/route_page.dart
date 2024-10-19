import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/auth/login_screen.dart';
import 'package:abs_office_management/view/auth/register_screen.dart';
import 'package:abs_office_management/view/auth/welcome_screen.dart';
import 'package:abs_office_management/view/settings/screen/tax_and_state.dart';
import 'package:abs_office_management/view/settings/setting_screen.dart';
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
        //middlewares: [AuthMiddleware()]
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

  ];
}