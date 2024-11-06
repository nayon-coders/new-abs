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
                child: Text("How much is your credit card processing fee? Please enter the percentage number so you can see in the sales dashboard how much will be deducted from your daily deposit.",
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
                      style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),
                      children: [

                        controller.isGetting.value ? const TextSpan(text: "---") : TextSpan(
                            text: controller.creditModel.value.data!.fee.toString(),
                            style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.textBlack)
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
