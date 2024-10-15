import 'package:flutter/material.dart';

import '../../../utility/app_color.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Text(text,
        style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: AppColors.textBlack),),
    );
  }
}
