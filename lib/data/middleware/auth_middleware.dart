
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../../routes/route_name.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Check user authentication status
      final token = sharedPreferences!.getString("token");
      print('AuthMiddleware - Token: $token');
      return token != null
          ? const RouteSettings(name: AppRoute.dashBoard)
          : const RouteSettings(name: AppRoute.welcome);
  }

  @override
  int? get priority => 1;
}
