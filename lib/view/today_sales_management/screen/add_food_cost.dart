import 'package:abs_office_management/controller/date_time_controller.dart';
import 'package:abs_office_management/view/today_sales_management/controller/food_cost_controller.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:abs_office_management/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';

class AddFoodCost extends GetView<FoodCostController> {
   AddFoodCost({super.key});
   final List cashItems =[
     "online",
     "cash",
     "card",
     "cheque",
   ];

   final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          controller.clearAllData();
          Get.back();
        }, icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        title:Obx(() {
          if(controller.isForEdit.value){
            return const Text("Edit Food Cost",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),);
          }else{
            return const Text("Add Food Cost",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),);
          }
          }
        ),

      ),
      body: SingleChildScrollView(
        padding:const  EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding:const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.textWhite,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("DR Platform Select",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
                  const SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.textWhite,
                      border: Border.all(color: AppColors.textBlue.withOpacity(0.4),width: 1)
                    ),
                    child: Obx(()=> Text(controller.selectedPlatform.value,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),)),
                  ),

                  const SizedBox(height: 30,),
                  Obx(() {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.vendorName.length,
                          itemBuilder: (context,index){

                            return _buildVendorWidgets(index);
                          }
                      );
                    }
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: AppButton(
                      width: 130,
                        name: "Add More",
                        textColor: AppColors.textBlack,
                        bgColor: Color(0xFFB7E0D1),
                        onClick: ()=>controller.addVendorName()),
                  ),

                  const SizedBox(height: 30,),
                  const Text("Date",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),
                  ),
                  const SizedBox(height: 10,),
                  AppInput(
                    readOnly: true,
                      onClick: ()async{
                        var date = await dateTimeController.pickDate(context);
                        controller.dateController.value.text = dateTimeController.dateFormatDatabase(date);
                        controller.selectedDate.value.text = dateTimeController.dateFormat1(date);
                      },
                      hint: "Select Date",
                      fillColor: AppColors.textWhite,
                      hintColor: AppColors.textBlue,
                      controller: controller.selectedDate.value,
                  ),
                  const SizedBox(height: 30,),
                  Center(
                    child: Obx(() {
                        return AppButton(
                          isLoading: controller.isAdding.value,
                            name: "Save",
                              onClick: (){
                                if(controller.isForEdit.value){
                                  controller.updateFoodCost();
                                }else{
                                  controller.addFoodCost();
                                }
                              }
                            );
                      }
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }

  Container _buildVendorWidgets(index) {
    return Container(
        padding:const  EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Name of vendor",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                ),
                index != 0 ? IconButton(
                  onPressed: ()=>controller.removeVendorName(index),
                  icon: Icon(Icons.delete,color: Colors.red,),
                )  :Center()
              ],
            ),
           const SizedBox(height: 10,),
            AppInput(hint: "Name",
              hintColor: AppColors.textBlue,
              fillColor: AppColors.textWhite,
              controller: controller.vendorName[index],
              textType: TextInputType.name,
            ),

            const SizedBox(height: 15,),

            const Text("Amount",
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
            ),
            const SizedBox(height: 10,),
            AppInput(hint: "0.00",
              hintColor: AppColors.textBlue,
              fillColor: AppColors.textWhite,
              controller: controller.vendorAmount[index],
              textType: TextInputType.number,
            ),



            const SizedBox(height: 15,),
            const Text("Pay By",
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
            ),
            const SizedBox(height: 10,),
            CustomDropDown(items: cashItems,
                fillColor: AppColors.textWhite,
                hint: "Cash", onChange: (v){
                  print(v);
                  controller.payList.insert(index, v!); //controller.payList[index] = v;
                  print("controller.payList[index] --- ${controller.payList[index]}");
              },
            ),
            Obx(() {
              print("controller.payList[index] --- ${controller.payList[index]}");
                return controller.payList.value[index] == "cheque" ?  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15,),

                    const Text("Cheque Number",
                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                    ),
                    const SizedBox(height: 10,),
                    AppInput(hint: "0.00",
                      hintColor: AppColors.textBlue,
                      fillColor: AppColors.textWhite,
                      controller: controller.chequeNumber[index],
                      textType: TextInputType.number,
                    ),
                  ],
                ) : Center();
              }
            ),
           const SizedBox(height: 20,),

          ],
        ),
      );
  }
}
