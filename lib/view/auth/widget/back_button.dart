import 'package:flutter/material.dart';

import '../../../utility/app_color.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({super.key, required this.onClick});
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin:const EdgeInsets.only(top: 24),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child:const Center(child: Icon(Icons.arrow_back_ios,size:16,color: AppColors.textBlack,)),
      ),
    );
  }
}
