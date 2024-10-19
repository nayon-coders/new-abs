import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/routes/route_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // //widgets binding
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   Future.delayed(const Duration(milliseconds: 1),(){
    //     if(sharedPreferences!.getString("token")!=null){
    //       Get.toNamed(AppRoute.dashBoard);
    //     }
    //   });
    // });

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RoutePage.routes,
      initialRoute:AppRoute.welcome,
    );
  }
}

