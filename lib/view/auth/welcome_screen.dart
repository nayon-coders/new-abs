import 'package:abs_office_management/utility/assetes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.welcome),fit: BoxFit.cover),
        ),
        child: Column(
          children: [

          ],
        ),

      ),
    );
  }
}
