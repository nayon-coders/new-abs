import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_shimmer.dart';

class LoadingLossProfitBoxsView extends StatelessWidget {
  const LoadingLossProfitBoxsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppShimmerPro.TextShimmer(width: 100, maxLine: 1),
            const SizedBox(height: 10,),
            GridView.builder(
              itemCount: 4,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index){
                return AppShimmerPro.circularShimmer(width: Get.width*.40, height: 100, borderRadius: 5);
              },
            )

          ]
      ),
    );
  }
}