import 'package:abs_office_management/utility/app_color.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key,
    required this.icon,
    required this.name,
    required this.onClick,
    this.iconColor=AppColors.textBlack
  });
  final IconData icon;
  final String name;
  final VoidCallback onClick;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:onClick,
      contentPadding:const EdgeInsets.only(left: 10),
      leading: Icon(icon,color:iconColor,),
      title: Text(name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: iconColor),),
    );
  }
}
