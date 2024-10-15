import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/routes/route_page.dart';
import 'package:abs_office_management/view/auth/login_screen.dart';
import 'package:abs_office_management/view/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RoutePage.routes,
      initialRoute:RouteName.welcome,




    );
  }
}

