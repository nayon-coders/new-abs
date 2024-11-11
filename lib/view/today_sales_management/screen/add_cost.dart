import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/view/today_sales_management/controller/cost_controller.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:abs_office_management/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/date_time_controller.dart';
import '../../../utility/app_color.dart';

class AddCost extends GetView<CostController> {
   AddCost({super.key});

   final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Obx(() {
          if(controller.isEditCosting.value){
            return const Text("Edit Cost",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),);
          }else{
            return const Text("Add Cost",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),);
          }
          }
        ),
        leading: IconButton(
          onPressed: (){
            controller.clearAll();
            controller.allCostList();
            Get.back();

          },
          icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,),
        ),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding:const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.textWhite,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                      const Text("DR Platform Select",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
                      InkWell(
                          onTap: ()=>Get.toNamed(AppRoute.manageCostingList),
                          child: const Text("Edit",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlue),)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                 Obx((){
                   if(controller.isCostListGetting.value){
                     return AppShimmerPro.circularShimmer(width: Get.width, height: 40, borderRadius: 10);
                    }else if(controller.costingListModel.value.data!.isEmpty){
                     return Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         const Center(child:  Text("No data found",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textBlack),)),
                          const SizedBox(height: 4,),
                         TextButton(onPressed: ()=>Get.toNamed(AppRoute.manageCostingList), child:const Text("Add Costing List",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlue),)),
                       ],
                     );
                   }else{
                     if(controller.isEditCosting.value){
                       return CustomDropDown(
                         value: controller.costPlatform.value,
                         items: controller.costingListModel.value.data!.map((e) => e.name!).toList(), hint: "Select cost platform", onChange: (v){
                         controller.costPlatform.value = v.toString();
                       });
                      }else {
                       return CustomDropDown(
                           items: controller.costingListModel.value.data!.map((
                               e) => e.name!).toList(),
                           hint: "Select cost platform",
                           onChange: (v) {
                             controller.costPlatform.value = v.toString();
                           });
                     }
                   }
                 }),

                  const SizedBox(height: 10,),

                  const Text("Amount",
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                  ),
                  const SizedBox(height: 10,),
                  AppInput(
                    hint: "0.00",
                    hintColor: AppColors.textBlue,
                    fillColor: AppColors.fillColor,
                    controller: controller.costAmount.value,
                    textType: TextInputType.number,
                  ),

                  const SizedBox(height: 20,),
                  const Text("Selected Date",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),
                  ),
                  const SizedBox(height: 10,),
                  Obx(() {
                      return AppInput(
                        onClick: ()async{
                          var date = await dateTimeController.pickDate(context);
                          print("date --- $date");
                          controller.selectedDate.value.text = dateTimeController.dateFormat1(date);
                          controller.costDate.value = dateTimeController.dateFormatDatabase(date);
                        },
                        readOnly: true,
                          hintColor: AppColors.textBlue,
                          fillColor: AppColors.fillColor,
                          hint: "Selected Date",
                        controller: controller.selectedDate.value,
                      );
                    }
                  ),

                  const SizedBox(height: 30,),
                  Center(
                    child: Obx(() {
                        return AppButton(
                          isLoading: controller.isAddCost.value,
                          width: 300,
                            name: "Save", onClick: (){
                            //CHECK IF THE COST NAME IS EMPTY
                            if(controller.costAmount.value.text.isEmpty){
                              Get.snackbar("Error", "Cost amount is required", backgroundColor: Colors.red, colorText: Colors.white);
                              return;
                            }
                            if(controller.isEditCosting.value){
                              controller.editCost();
                            }else{
                              controller.createCost();
                            }
                        });
                      }
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
