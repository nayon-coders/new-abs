import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/auth/login_screen.dart';
import 'package:abs_office_management/view/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutePage{
  static List<GetPage<dynamic>> routes=[
    GetPage(
        name: RouteName.welcome,
        page: ()=>const WelcomeScreen()
    ),

    GetPage(
        name: RouteName.login,
        page: ()=>const LoginScreen(),
    ),

  ];
}