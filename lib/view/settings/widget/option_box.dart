import 'package:flutter/material.dart';

import '../../../utility/app_color.dart';

class OptionBox extends StatelessWidget {
  const OptionBox({super.key, required this.title, required this.column});
  final String title;
  final List<Widget> column;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(title,style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
        const SizedBox(height: 10,),
        Container(
          padding:const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.textWhite
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:column,
          ),

        ),

      ],
    );
  }
}
