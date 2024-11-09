import 'package:abs_office_management/utility/app_color.dart';
import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key, required this.width, required this.name});
  final double width;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.center,
        child: Text(name,
          textAlign: TextAlign.start,
          style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color:AppColors.textindico),),
      ),
    );
  }
}
