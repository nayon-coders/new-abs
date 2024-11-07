import 'package:abs_office_management/utility/app_color.dart';
import 'package:flutter/material.dart';

class YearMonth extends StatelessWidget {
  const YearMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(child: Text("UpComing.....",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: AppColors.textBlack),),),
    );
  }
}
