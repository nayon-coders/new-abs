import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';

class CreditcardProcessingFee extends StatelessWidget {
   CreditcardProcessingFee({super.key});
  final _processingFee = TextEditingController();

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
              controller: _processingFee,
            ),
            const SizedBox(height: 20,),
            AppButton(
                name: "Save",
                width: 130,
                onClick: (){},
            ),

            const SizedBox(height: 30,),
            RichText(
              text:const TextSpan(
                text: "Credit card processing fee: ",
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),
                children: [
                  TextSpan(
                    text: "2.34%",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.textBlack)
                  )
                ]
              ),)
            

          ],
        ),
      ),
    );
  }
}
