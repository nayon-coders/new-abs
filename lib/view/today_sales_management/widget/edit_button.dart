import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key,
    this.bgColor =Colors.black,
    required this.onClick,
    this.icon= Icons.edit});
  final Color? bgColor;
  final VoidCallback onClick;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: bgColor,
        ),
        child: Icon(icon,color: Colors.white,size: 15,),
      ),
    );
  }
}