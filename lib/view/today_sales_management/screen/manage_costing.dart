import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/app_const.dart';
import 'package:abs_office_management/view/today_sales_management/controller/cost_controller.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/route_name.dart';
import '../../../widgets/app_button.dart';

class ManageCosting extends GetView<CostController> {
  const ManageCosting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.textWhite,
        title: const Text("Manage Costing"),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("DR platform",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 10,),
                AppInput(hint: "Add cost name", controller: controller.costNameController.value),
                SizedBox(height: 20,),
                Obx((){
                    return AppButton(
                      width: 150,
                      isLoading: controller.isCostListAdding.value,
                      name: 'Save',
                      onClick: () {
                         //CHECK IF THE COST NAME IS EMPTY
                        if(controller.costNameController.value.text.isEmpty){
                          Get.snackbar("Error", "Cost name is required", backgroundColor: Colors.red, colorText: Colors.white);
                          return;
                        }
                        if(controller.isEditCostListName.value){
                          //controller.editCostingList();
                        }else{
                          controller.addCostingList();
                        }

                      },


                    );
                  }
                )


              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15),
            child: Text("Costing List",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
            ),
          ),
          
          Obx(() {
            if (controller.isCostListGetting.value) {
              return Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index){
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: AppShimmerPro.circularShimmer(width: Get.width, height: 50, borderRadius: 10));
                  },
                ),
              );
            }else if(controller.costingListModel.value.data!.isEmpty){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: const Text("No data found",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textBlack),)),
                  const SizedBox(height: 4,),
                  TextButton(onPressed: ()=>controller.getCostList(), child: const Text("Try again",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlue),)),
                ],
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.costingListModel.value.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 40, height: 40,
                          //padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(child: Text(controller.costingListModel.value.data![index].name![0], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.mainColor),)),
                        ),
                        title: Text(controller.costingListModel.value.data![index].name!),
                        trailing: Obx(() {
                            return IconButton(
                              onPressed: () {
                                alertDialog(
                                    title: "Hold On!",
                                    content: "Are you sure? Do you want to delete this item?",
                                    onOk: ()=>controller.deleteCostListName(controller.costingListModel.value.data![index].id!.toString()),
                                );
                              },
                              icon: controller.isCostListDelete.value ? CircularProgressIndicator.adaptive(backgroundColor: Colors.red,) : Icon(Icons.delete, color: Colors.red,),
                            );
                          }
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
