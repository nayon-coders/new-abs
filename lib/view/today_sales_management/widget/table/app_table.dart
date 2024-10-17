import 'package:flutter/material.dart';

import '../../../../utility/app_color.dart';

class AppTable extends StatelessWidget {
  const AppTable({super.key,
    this.height=45,
    required this.headerChildren,
    required this.row,
  });

  final double? height;
  final List<Widget> headerChildren;
  final Widget row;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(6),
      margin:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.textWhite,
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ///----Header-----
          Container(
            height: height,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:headerChildren,

            ),
          ),
         const Divider(),
          row


        ],
      ),
    );
  }
}
