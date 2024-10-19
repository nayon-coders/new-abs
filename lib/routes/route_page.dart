import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/auth/login_screen.dart';
import 'package:abs_office_management/view/auth/register_screen.dart';
import 'package:abs_office_management/view/auth/welcome_screen.dart';
import 'package:abs_office_management/view/dash_board_screen/dash_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/middleware/auth_middleware.dart';
import '../view/auth/forgot_password/forgot_screen.dart';

class RoutePage{
  static List<GetPage<dynamic>> routes=[
    GetPage(
        name: AppRoute.welcome,
        page: ()=>const WelcomeScreen(),
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

  ];
}