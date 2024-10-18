import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:abs_office_management/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';

class AddFoodCost extends StatelessWidget {
   AddFoodCost({super.key});
   final _name = TextEditingController();
   final _amount = TextEditingController();
   final _date = TextEditingController();
   //dropdown
  final List items =[
    "item1",
    "item2",
    "item3"
  ];
   final List cashItems =[
     "online",
     "cash",
     "card"
   ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        title:const Text("Add Food Cost",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),

      ),
      body: SingleChildScrollView(
        padding:const  EdgeInsets.all(20),
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
                  CustomDropDown(
                      items: items,
                      hint: "Select cost platform", onChange: (v){}),

                  const SizedBox(height: 30,),
                  Container(
                    padding:const  EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.bgColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 15,),
                        const Text("Name of vendor",
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                        ),
                       const SizedBox(height: 10,),
                        AppInput(hint: "Name",
                          hintColor: AppColors.textBlue,
                          fillColor: AppColors.textWhite,
                          controller: _name,
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
                          controller: _amount,
                          textType: TextInputType.number,
                        ),

                        const SizedBox(height: 15,),
                        const Text("Pay By",
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                        ),
                        const SizedBox(height: 10,),
                        CustomDropDown(items: cashItems,
                            fillColor: AppColors.textWhite,
                            hint: "Cash", onChange: (v){},
                        ),
                       const SizedBox(height: 20,),
                        
                      ],
                    ),
                  ),
                 const  SizedBox(height: 10,),
                  
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppButton(
                      width: 130,
                        name: "Add More",
                        textColor: AppColors.textBlack,
                        bgColor: Color(0xFFB7E0D1),
                        onClick: (){}),
                  ),
                  
                  const SizedBox(height: 30,),
                  const Text("Date",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),
                  ),
                  const SizedBox(height: 10,),
                  AppInput(
                      hint: "5 January 1990",
                      fillColor: AppColors.textWhite,
                      hintColor: AppColors.textBlue,
                      controller: _date,
                  ),
                  const SizedBox(height: 30,),
                  Center(
                    child: AppButton(
                        name: "Save",
                        onClick: (){}),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            )
          ],
        ),

      ),
    ));
  }
}
