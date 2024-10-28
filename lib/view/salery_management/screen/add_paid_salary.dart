import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:abs_office_management/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaidSalary extends StatelessWidget {
   AddPaidSalary({super.key});

  final List employeeItem =["employee1","employee2","employee3"];
   List payItem =["Cash","Check","Online", "Bank Transfer"];

  final _amount = TextEditingController();
  final _selectDate = TextEditingController();
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
        padding:const EdgeInsets.all(20),
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
                  CustomDropDown(items: employeeItem, hint: "Employee name", onChange: (v){}),
                  const SizedBox(height: 20,),

                  //Amount
                  const Text("Amount",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
                  const SizedBox(height: 10,),
                  AppInput(
                    fillColor: AppColors.fillColor,
                    textType: TextInputType.number,
                    hint: "\$ 0.000",
                    hintColor:AppColors.textBlue ,
                    controller: _amount,

                  ),
                  const SizedBox(height: 20,),

                  //Pay bay
                  const Text("Pay By",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
                  const SizedBox(height: 10,),
                  CustomDropDown(items: payItem, hint: "Pay By", onChange: (v){}),

                  const SizedBox(height: 20,),

                  //selected Date
                  const Text("Select Date",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
                  const SizedBox(height: 10,),
                  AppInput(
                    fillColor: AppColors.fillColor,
                    hint: "Select Date",
                    hintColor:AppColors.textBlue ,
                    controller: _selectDate,
                    readOnly: true,

                  ),
                  const SizedBox(height: 20,),



                ],
              ),
            ),
            const SizedBox(height: 50,),
            Center(child: AppButton(name: "Save", onClick: (){})),
          ],
        ),
      ),
    );
  }
}
