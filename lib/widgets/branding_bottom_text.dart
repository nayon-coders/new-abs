import 'package:flutter/material.dart';

import '../utility/app_color.dart';


class BrandingBottomText extends StatelessWidget {
  const BrandingBottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("All rights reserved by @ABS Office Management",style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.textGrey,
      ),),
    );
  }
}
