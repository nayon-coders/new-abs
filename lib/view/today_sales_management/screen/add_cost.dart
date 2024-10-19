import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:abs_office_management/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';

class AddCost extends StatelessWidget {
   AddCost({super.key});
  final _amount = TextEditingController();
  final _dateTime = TextEditingController();
  final List item = [
    "item1",
    "item2",
    "item3",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: AppBar(
            title: const Text("Add Cost",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
            leading: IconButton(
              onPressed: ()=>Get.back(),
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
                      const Text("DR Platform Select",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
                      const SizedBox(height: 10,),
                     ///TODO:DropDown
                      CustomDropDown(items: item, hint: "Select cost platform", onChange: (v){}),

                      const SizedBox(height: 10,),

                      const Text("Amount",
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                      ),
                      const SizedBox(height: 10,),
                      AppInput(
                        hint: "0.00",
                        hintColor: AppColors.textBlue,
                        fillColor: AppColors.fillColor,
                        controller: _amount,
                        textType: TextInputType.number,
                      ),

                      const SizedBox(height: 20,),
                      const Text("Selected Date",
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),
                      ),
                      const SizedBox(height: 10,),
                      AppInput(
                        readOnly: true,
                          hintColor: AppColors.textBlue,
                          fillColor: AppColors.fillColor,
                          hint: "Selected Date",
                        controller: _dateTime,
                      ),

                      const SizedBox(height: 30,),
                      Center(
                        child: AppButton(
                          width: 300,
                            name: "Save", onClick: (){}),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),
    );
  }
}
