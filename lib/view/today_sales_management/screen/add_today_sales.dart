import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodaySales extends StatelessWidget {
   AddTodaySales({super.key});
  final _grossSales = TextEditingController();
  final _creditSales = TextEditingController();
  final _totalCashCollect = TextEditingController();
  final _platformName = TextEditingController();
  final _amount = TextEditingController();
  final _dateTime = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title:const Text("Add Today Sales",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textindico),
        ),
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: AppColors.textindico,)),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Gross Sales ,Credit Sales ,Total Cash collect
            Container(
              height: MediaQuery.sizeOf(context).height*0.50,
              width: double.infinity,
              padding:const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.textWhite,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  //Gross Sales
                  const Text("Gross Sales",
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                  ),
                 const  SizedBox(height: 10,),
                  AppInput(
                    hintColor: AppColors.textBlue,
                    hint: "0.00",
                    controller: _grossSales,
                    fillColor: AppColors.textWhite,
                    textType: TextInputType.number,
                  ),


                  const SizedBox(height: 10,),

                  //Tax 
                const  Text("Tax: 6.758% = \$34.90",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFFFE5C73)),),

                 const SizedBox(height: 15,),




                  //Credit Sales
                const  Text("Credit Sales",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                ),
                  const SizedBox(height: 10,),
                  AppInput(
                      hintColor: AppColors.textBlue,
                      hint: "0.0",
                      textType: TextInputType.number,
                      fillColor: AppColors.textWhite,
                      controller: _creditSales),


                  const SizedBox(height: 15,),



                  //Total Cash collect
                 const Text("Total Cash collect",
                   style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                 ),
                 const SizedBox(height: 10,),
                  AppInput(
                      hint: "0.0",
                      hintColor: AppColors.textBlue,
                      fillColor: AppColors.textWhite,
                      textType: TextInputType.number,
                      controller: _totalCashCollect),




                ],
              ),
            ),

            //----Online Platform----
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Online Sales",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
                InkWell(
                  onTap: (){},
                    child:const Text("Edit",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textindico),)),
              ],
            ),

            const SizedBox(height: 10,),
            Container(
              padding:const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.textWhite,
              ),
              child: Column(
                children: [
                 const  SizedBox(height: 20,),
                  Container(
                    padding:const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.bgColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const  Text("Platform name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
                       const  SizedBox(height: 10,),
                        AppInput(
                          hint: "name",
                          hintColor: AppColors.textBlue,
                            textType:TextInputType.name,
                            fillColor: AppColors.textWhite,
                            controller: _platformName,
                        ),
                        const SizedBox(height: 20,),

                        const Text("Amount",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
                        const SizedBox(height: 10,),
                        AppInput(hint: "0.00",
                          hintColor: AppColors.textBlue,
                          textType:TextInputType.number,
                          fillColor: AppColors.textWhite,
                          controller: _amount,
                        ),
                        const SizedBox(height: 20,),


                      ],
                    ),
                  ),


                  const SizedBox(height: 30,),
                  Container(
                    padding:const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.bgColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const  Text("Platform name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
                        const  SizedBox(height: 10,),
                        AppInput(hint: "name",
                          hintColor: AppColors.textBlue,
                          textType:TextInputType.name,
                          fillColor: AppColors.textWhite,
                          controller: _platformName,
                        ),
                        const SizedBox(height: 20,),

                        const Text("Amount",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
                        const SizedBox(height: 10,),
                        AppInput(hint: "0.00",
                          hintColor: AppColors.textBlue,
                          textType:TextInputType.number,
                          fillColor: AppColors.textWhite,
                          controller: _amount,
                        ),
                       const SizedBox(height: 10,),


                      ],
                    ),
                  ),
                  const  SizedBox(height: 20,),
                ],
              ),
            ),

            const SizedBox(height: 20,),

            //-------Date Time ----
            const Text("Date of Birth",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
              readOnly: true,
              onClick: (){},
              hint: "DateTime",
              hintColor: AppColors.textBlue,
              fillColor: AppColors.textWhite,
              controller: _dateTime,
            ),

            const SizedBox(height: 30,),
            Center(
              child: AppButton(
                width: 300,
                  name: "Save",
                  onClick: (){},
              ),
            ),
            const SizedBox(height: 20,),


          ],
        ),
      ),
    ));
  }
}
