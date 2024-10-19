import 'package:flutter/material.dart';

import '../../../utility/app_color.dart';

class WorkingHours extends StatelessWidget {
   WorkingHours({super.key, required this.dateTime, required this.hours, required this.onClick});
  final String dateTime;
  final String hours;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,
      width: double.infinity,
      padding:const EdgeInsets.all(6),
      margin:const EdgeInsets.only(left: 20,right: 20,bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.textWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:const Color(0xFFFAF7DC),
            ),
            child: Text(dateTime,style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:const Color(0xFFCAF5D9),
            ),
            child: Text("${hours} h",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
          ),
          InkWell(
              onTap:onClick,
              child:const Text("View Details",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.indigo),))
        ],
      ),
    );
  }
}
