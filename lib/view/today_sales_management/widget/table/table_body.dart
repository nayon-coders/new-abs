import 'package:flutter/material.dart';

import '../../../../utility/app_color.dart';


class TableBody extends StatelessWidget {
  const TableBody({
    super.key, required this.text, required this.width, this.fontWeight = FontWeight.w600, this.color = AppColors.textBlack,
  });

  final String text;
  final double width;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Center(child: Text(text,style: TextStyle(fontSize: 12,fontWeight: fontWeight, color: color),)));
  }
}