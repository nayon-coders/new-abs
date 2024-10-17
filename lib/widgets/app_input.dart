
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class AppInput extends StatelessWidget {
  AppInput({super.key,
    required this.hint,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.textType,
    this.onClick,
    this.onChanged,
    this.maxLine = 1,
    this.fillColor=AppColors.fillColor,
    this.isValidatorNeed = true,
    this.circuler =10

  });
  final String hint;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  String? Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;
  final TextInputType?textType;
  final VoidCallback? onClick;
  final Function(String)? onChanged;
  final int maxLine;
  final Color? fillColor;
  final bool isValidatorNeed;
  final double circuler;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onClick,
      onChanged: onChanged,
      maxLines: maxLine,
      keyboardType:textType,
      style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color:Colors.grey),
      readOnly:readOnly ,
      obscureText:obscureText ,
      controller:controller ,
      validator: (v){
        if(isValidatorNeed){
          if(v!.isEmpty){
            return "This filed must not be empty.";
          }
          return null;
        }

      },
      decoration: InputDecoration(
        contentPadding:const EdgeInsets.only(left: 15,),
        filled: true,
        fillColor: fillColor,
        hintText: hint,
        hintStyle:const TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Colors.black),

        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(circuler),
          borderSide:const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(circuler),
          borderSide:const BorderSide(color: AppColors.borderColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(circuler),
          borderSide:const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(circuler),
          borderSide:const BorderSide(color: AppColors.borderColor),
        ),
      ),
    );
  }
}