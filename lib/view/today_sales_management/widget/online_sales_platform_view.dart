import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/settings/controller/online.sales.platform.controller.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';
import '../../../widgets/app_input.dart';
import '../controller/sales_controller.dart';

class OnlinePlatformListView extends GetView<OnlineSalesPlatformController> {
  const OnlinePlatformListView({
    super.key,
    required this.salesController,
  });

  final SalesController salesController;

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   for(var i in controller.onlineSalesPlatformModel.value.data!){
    //     salesController.platformNameList.add(TextEditingController(text: i.name));  // add platform name to the list
    //   }
    // });
    return Obx(() {
      if(controller.isGetting.value){
        return AppShimmerPro.circularShimmer(width: Get.width, height: 180, borderRadius: 10);
      }else if(controller.onlineSalesPlatformModel.value.data!.isEmpty) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.textWhite,
          ),
          child: Column(
            children: [
              Center(
                child: Text("No online platform found", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack),),
              ),
              //button
              const SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.onlineSellPlatform); // navigate add online platform
                  },
                  child: const Text("Add Online Platform"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }else {

        return ListView.builder(
          itemCount: controller.onlineSalesPlatformModel.value.data!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            salesController.amountList.add(TextEditingController());

            return Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.bgColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Platform Name",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight
                        .w500, color: AppColors.textBlack),),
                   SizedBox(height: 10,),
                   Container(
                     padding: EdgeInsets.all(12),
                     width: Get.width,
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.green.withOpacity(0.1 ),
                     ),
                     child: Text("${salesController.platformNameList.value[index]!.name}",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight
                          .w600, color: AppColors.textBlack),),
                   ),
                  const SizedBox(height: 10,),
                  const Text("Total sales",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight
                        .w500, color: AppColors.textBlack),),
                  const SizedBox(height: 10,),
                  AppInput(hint: "0.00",
                    hintColor: AppColors.textBlue,
                    textType: TextInputType.number,
                    fillColor: AppColors.textWhite,
                    controller: salesController.amountList[index],
                  ),
                  const SizedBox(height: 20,),


                ],
              ),
            );
          },
        );
      }
      }
    );
  }
}
