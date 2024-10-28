import 'package:abs_office_management/controller/date_time_controller.dart';
import 'package:abs_office_management/data/model/employee_model/single_empolyee_model.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/salery_management/controller/salary_management_controller.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:abs_office_management/widgets/custom_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/employee_model/get_all_employee_model.dart';

class AddPaidSalary extends GetView<SalaryManagementController> {
   AddPaidSalary({super.key});

   List payItem =["Cash","Check","Online", "Bank Transfer"];

   final DateTimeController dateTimeController = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(),
          icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,),),

        title:const Text("Paid Salary",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),
        ),

        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding:const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.textWhite,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //select employee
                  const Text("Select employee",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
                  const SizedBox(height: 10,),
                  Obx(() {
                      return DropdownButtonHideUnderline(
                        child: DropdownButton2<SingleEmployee>(
                          isExpanded: true,
                          hint: Text(
                            'Select Employee',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: controller.employeeList.map((SingleEmployee item) => DropdownMenuItem<SingleEmployee>(
                            value: item,
                            child: Text(
                              item.name!,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          )).toList(),
                          value: controller.selectedEmployee.value ?? null,
                          onChanged: (SingleEmployee? value) {
                            controller.selectedEmployee.value = value!;
                          },
                          buttonStyleData:  ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 50,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.fillColor,
                            )
                          ),
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 20,),

                  //Amount
                  const Text("Amount",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
                  const SizedBox(height: 10,),
                  AppInput(
                    fillColor: AppColors.fillColor,
                    textType: TextInputType.number,
                    hint: "\$ 0.000",
                    hintColor:AppColors.textBlue ,
                    controller: controller.amount.value,

                  ),
                  const SizedBox(height: 20,),

                  //Pay bay
                  const Text("Pay By",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
                  const SizedBox(height: 10,),
                  CustomDropDown(
                      items: payItem,
                      hint: "Pay By",
                      onChange: (v){
                        controller.selectedPayMethod.value = v;
                      }
                  ),
                  Obx((){
                    if(controller.selectedPayMethod.value == "Check"){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          const Text("Check Number",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
                          const SizedBox(height: 10,),
                          AppInput(
                            fillColor: AppColors.fillColor,
                            hint: "Check Number",
                            hintColor:AppColors.textBlue ,
                            controller: controller.checkNo.value,
                          ),
                        ],
                      );
                    }else{
                      return Center();
                    }
                  }),

                  const SizedBox(height: 20,),

                  //selected Date
                  const Text("Select Date",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
                  const SizedBox(height: 10,),
                  AppInput(
                    fillColor: AppColors.fillColor,
                    hint: "Select Date",
                    hintColor:AppColors.textBlue ,
                    controller: controller.selectDateShow.value,
                    readOnly: true,
                    onClick: ()async{
                      var data = await dateTimeController.pickDate(context);
                      controller.selectDateShow.value.text = dateTimeController.dateFormat1(data).toString();
                      controller.selectDateDatabase.value.text = dateTimeController.dateFormatDatabase(data).toString();
                    },

                  ),
                  const SizedBox(height: 20,),



                ],
              ),
            ),
            const SizedBox(height: 50,),
            Center(child: Obx(() {
                return AppButton(
                    isLoading: controller.isAdding.value,
                    name: "Save",
                    onClick: (){
                      controller.addSalary();
                    }
                );
              }
            )),
          ],
        ),
      ),
    );
  }
}
