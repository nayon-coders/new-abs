import 'package:flutter/material.dart';

import '../../../utility/app_color.dart';

class CardMenus extends StatelessWidget {
  const CardMenus({super.key, required this.workingName, required this.number});
  final String workingName;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      height: 60,
      width: 110,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.textWhite,
        boxShadow: const [
          BoxShadow(
              blurRadius:4,
              spreadRadius: 0.2,
              color: Colors.grey

          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(workingName,style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 11,color:Color(0xFF4F4F4F), ),),
         const SizedBox(height: 6,),
          Text(number,style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color:Color(0xFF4F4F4F), ),),
        ],
      ),
    );
  }
}
