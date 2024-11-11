import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/routes/route_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  checkAuth();
  runApp(const MyApp());
}

String checkAuth() {
    if(sharedPreferences!.getString("token")!=null){
     return AppRoute.dashBoard;
    }else{
      return AppRoute.welcome;
    }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RoutePage.routes,
      initialRoute: checkAuth(),
     // home: const WelcomeScreen(),
    );
  }
}

