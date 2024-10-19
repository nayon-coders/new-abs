
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../../routes/route_name.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Check user authentication status
    return sharedPreferences!.getString("token") != null ? const RouteSettings(name: AppRoute.dashBoard) : const RouteSettings(name: AppRoute.login);
  }

  @override
  int? get priority => 1;
}
