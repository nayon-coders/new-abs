import 'package:flutter/material.dart';

import '../../../utility/app_color.dart';

class OnlineSalesBox extends StatelessWidget {
  const OnlineSalesBox({super.key,
    required this.costName,
    required this.costAmount,
    required this.image,
    required this.onClick,
    this.bgColor=AppColors.linkColor,
  });
  final String costName;
  final String costAmount;
  final String image;
  final VoidCallback onClick;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding:const EdgeInsets.all(10),

        height: 80,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.textWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              padding:const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: bgColor,
              ),
              child: Center(child: Text("${image}",
                style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black
                ),
              )),
            ),
            const SizedBox(width: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(costName,style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.textBlue),),
                const SizedBox(height: 6,),
                Text("\$$costAmount",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
