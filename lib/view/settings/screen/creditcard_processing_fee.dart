import 'package:abs_office_management/view/settings/controller/creditcard_processing_fee_controller.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';

class CreditcardProcessingFee extends GetView<CreditcardProcessingFeeController> {
   CreditcardProcessingFee({super.key});
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: const Text("Credit Card Processing Fee",style: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        leading: IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 350,
                child: Text("Note the percentage of credit card processing fees you deduct from your daily sales so that you can add this to your loss and trophy.",
                style: TextStyle(fontWeight:FontWeight.w400,fontSize: 14,color: AppColors.textBlack),),
              ),

              const SizedBox(height: 20,),
              const Text("Processing Fee",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
              const SizedBox(height: 10,),

              AppInput(
                hint: "0.00",
                fillColor: AppColors.textWhite,
                textType: TextInputType.number,
                controller: controller.creditCardFee.value,
              ),
              const SizedBox(height: 20,),
              Obx(() {
                  return AppButton(
                    isLoading: controller.isAdding.value,
                      name: "Save",
                      width: 130,
                      onClick: (){
                        if(_key.currentState!.validate()){
                          controller.addCreditCardFee();
                        }
                      },
                  );
                }
              ),

              const SizedBox(height: 30,),
            Obx(() {
                return RichText(
                  text: TextSpan(
                      text: "Credit card processing fee: ",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),
                      children: [

                        controller.isGetting.value ? TextSpan(text: "---") : TextSpan(
                            text: controller.creditModel.value.data!.fee.toString(),
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.textBlack)
                        )
                      ]
                  ),);
              }
            ),



            ],
          ),
        ),
      ),
    );
  }
}
