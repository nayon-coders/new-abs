import 'package:flutter/material.dart';

import '../../../utility/app_color.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({super.key, required this.name, required this.icon, required this.onClick});
  final String name;
  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      contentPadding: EdgeInsets.zero,
      //contentPadding:const EdgeInsets.only(left: 10,right: 10),
      leading: Icon(icon,color: AppColors.textBlack,),
      title: Text(name,style:const TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
      trailing:const Icon(Icons.arrow_forward_ios,color: AppColors.textBlack,size: 16,),

    );
  }
}
