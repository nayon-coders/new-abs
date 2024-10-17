import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:flutter/material.dart';
class MenuBox extends StatelessWidget {
  const MenuBox({super.key, required this.name, required this.image, required this.onClick});
  final String name;
  final String image;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding:const EdgeInsets.all(10),
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.textWhite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Image.asset(image,height: 90,width: 90,fit: BoxFit.contain,),
            const SizedBox(height: 10,),
            Text(name,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
          ],
        ),
      ),
    );
  }
}
