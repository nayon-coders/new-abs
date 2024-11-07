import 'package:abs_office_management/controller/date_time_controller.dart';
import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/settings/controller/creditcard_processing_fee_controller.dart';
import 'package:abs_office_management/view/settings/controller/online.sales.platform.controller.dart';
import 'package:abs_office_management/view/settings/controller/tax.controller.dart';
import 'package:abs_office_management/view/settings/screen/creditcard_processing_fee.dart';
import 'package:abs_office_management/view/today_sales_management/controller/sales_controller.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/online_sales_platform_view.dart';

class AddTodaySales extends GetView<SalesController> {
   AddTodaySales({super.key});


   //tax controller
   final TaxController taxController = Get.find<TaxController>();
   final DateTimeController dateController = Get.find<DateTimeController>();
   final OnlineSalesPlatformController onlineSalesPlatformController = Get.find<OnlineSalesPlatformController>();
   final CreditcardProcessingFeeController creditCardProcessingFee = Get.find<CreditcardProcessingFeeController>();

   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Obx(() {
            return Text(controller.isEdit.value ? "Edit Sales" : "Add Today Sales",
              style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textindico),
            );
          }
        ),
        leading: IconButton(onPressed: (){
          controller.clearData();
          Get.back();
        }, icon:const Icon(Icons.arrow_back_ios,color: AppColors.textindico,)),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Gross Sales ,Credit Sales ,Total Cash collect
              Container(
                //height: MediaQuery.sizeOf(context).height*0.50,
                width: double.infinity,
                padding:const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
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
                    Obx(() {
                        return AppInput(
                          hintColor: AppColors.textBlue,
                          hint: "0.00",
                          controller: controller.grossSales.value,
                          fillColor: AppColors.textWhite,
                          textType: TextInputType.number,
                          onChanged: (v){
                            if(v.isNotEmpty){
                              controller.calculateTax(double.parse(v), double.parse("${taxController.taxStateModel.value.data!.tax}"));
                              controller.calculateCreditSalesAndTotalCashCollect();
                            }else{
                              controller.totalTaxAmount.value = 0.0;
                            }
                          },
                        );
                      }
                    ),


                    const SizedBox(height: 10,),

                    //Tax
                    _buildTaxWidgets(),

                   const SizedBox(height: 15,),




                    //Credit Sales
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx((){
                        if(creditCardProcessingFee.isGetting.value){
                          return AppShimmerPro.TextShimmer(width: 150, maxLine: 1);
                        }else{
                          return RichText(text: TextSpan(
                              text: "Credit Sales ",
                              style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                              children: [
                                TextSpan(
                                  text: "(Credit card processing fee = ${creditCardProcessingFee.creditModel.value.data!.fee}%)",
                                  style:  TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color:Colors.orange),
                                )
                              ]
                          ));

                        }
                        }
                      ),
                      InkWell(
                        onTap: ()=>Get.toNamed(AppRoute.creditCard),
                        child: Text("Edit",
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.linkColor),
                        ),
                      ),
                    ],
                  ),
                    const SizedBox(height: 10,),
                    Obx((){
                      if(creditCardProcessingFee.isGetting.value){
                        return AppShimmerPro.circularShimmer(width: Get.width, height: 45, borderRadius: 5);
                      }else{
                        return AppInput(
                          hint: "0.0",
                          hintColor: AppColors.textBlue,
                          fillColor: AppColors.textWhite,
                          textType: TextInputType.number,
                          controller: controller.creditSales.value,
                        );
                      }

                      }
                    ),


                    const SizedBox(height: 15,),



                    //Total Cash collect
                   const Text("Total Cash collect",
                     style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                   ),
                   const SizedBox(height: 10,),
                    Obx(() {
                        return AppInput(
                            hint: "0.0",
                            hintColor: AppColors.textBlue,
                            fillColor: AppColors.textWhite,
                            textType: TextInputType.number,
                            onChanged: (v){
                              controller.calculateCreditSalesAndTotalCashCollect();
                            },
                            controller: controller.totalCashCollect.value);
                      }
                    ),




                  ],
                ),
              ),

              //----Online Platform----
              const SizedBox(height: 10,),
              Obx((){
                if(controller.shortOver.value == 0.0){
                  return const Center();
                }else{
                  bool isShortOver = controller.shortOver.value < 0;
                  return Text("Short Over = ${ controller.shortOver.value.abs().toStringAsFixed(2)}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color:isShortOver ? AppColors.red  : AppColors.mainColor
                    ),
                  );
                }

              }),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Online Sales",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
                  InkWell(
                    onTap: ()=>Get.toNamed(AppRoute.onlineSellPlatform),
                      child:const Text("Edit",
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.linkColor),
                      )
                  ),
                ],
              ),

              const SizedBox(height: 10,),
            Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textWhite,
                ),
                child:  OnlinePlatformListView(salesController: controller),
            ),


              const SizedBox(height: 20,),
              InkWell(
                onTap: () => controller.isOpenAdditionalBox.value = !controller.isOpenAdditionalBox.value,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.textWhite,
                  ),
                  child:  Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         const Text("Additional Income",
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.red),
                          ),
                          Icon( controller.isOpenAdditionalBox.value? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down,color: AppColors.textBlue,)  //Add Icon
                        ],
                      );
                    }
                  ),
                ),
              ),
              Obx(() {
                  if(controller.isOpenAdditionalBox.value){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        const Text("Additional Income",
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                        ),
                        const SizedBox(height: 10,),
                        AppInput(
                          hint: "0.0",
                          hintColor: AppColors.textBlue,
                          fillColor: AppColors.textWhite,
                          textType: TextInputType.number,
                          controller: controller.additionalIncome.value,
                        ),
                      ],
                    );
                  }else{
                    return Container();
                  }
                }
              ),
              const SizedBox(height: 20,),

              //-------Date Time ----
              const Text("Selected Date",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
              const SizedBox(height: 10,),
              AppInput(
                readOnly: true,
                onClick: ()async{
                 await dateController.pickDate(context);
                 controller.dateTime.value.text =  dateController.dateFormat1(dateController.selectedDate.value);
                 controller.dateTimeDatabase.value =  dateController.dateFormatDatabase(dateController.selectedDate.value);
                },
                hint: "Selected Date",
                hintColor: AppColors.textBlue,
                fillColor: AppColors.textWhite,
                controller: controller.dateTime.value,
              ),

              const SizedBox(height: 30,),
              Center(
                child: Obx(() {
                    return AppButton(
                      bgColor: controller.isEdit.value ? Colors.amber: AppColors.mainColor,
                      isLoading: controller.isAdd.value,
                      width: 300,
                        name: "Save",
                        onClick: (){
                          //check validation
                          if(_formKey.currentState!.validate()){
                            if(controller.isEdit.value){
                              controller.editSales();
                            }else{
                              controller.addSales();
                            }

                          }
                        },
                    );
                  }
                ),
              ),
              const SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }

  Obx _buildTaxWidgets() {
    return  Obx(() {
      if(taxController.isLoading.value){
        return AppShimmerPro.TextShimmer(width: Get.width*.60, maxLine: 1);
      }else if(taxController.isTaxStatus.value == false){
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(text:const TextSpan(
                  text: "Tax ",
                  style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                  children: [
                    TextSpan(
                      text: "(please enter your tax manually)",
                      style:  TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color:Colors.orange),
                    )
                  ]
                )),
                InkWell(
                  onTap: ()=>Get.toNamed(AppRoute.textAndState),
                  child:const Text("Edit",
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.linkColor),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            AppInput(
              hint: "0.0",
              hintColor: AppColors.textBlue,
              fillColor: AppColors.textWhite,
              textType: TextInputType.number,
              controller: taxController.taxController.value,
            ),
            const SizedBox(height: 10,),
          ],
        );
      }else{
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text("Tax",
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),
                  ),
                  const SizedBox(width: 5,),
                  Obx(() {
                      return Text("${taxController.taxStateModel.value.data!.tax} % = ${controller.grossSales.value.text.isEmpty
                          ? 0.00: controller.totalTaxAmount.value.toStringAsFixed(2)}",
                        style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.red),
                      );
                    }
                  ),
                ],
              ),
              InkWell(
                onTap: ()=>Get.toNamed(AppRoute.textAndState),
                child:const Text("Edit",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.linkColor),
                ),
              )
            ],
          );
      }

      }
    );
  }
}

