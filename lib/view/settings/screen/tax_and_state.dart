import 'package:abs_office_management/view/settings/controller/tax.controller.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';

class TaxAndState extends GetView<TaxController> {
  const TaxAndState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.textWhite,
        title:const Text("Tax & State",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        leading: IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child: Column(
          children: [
           const SizedBox(
              width: 350,
                child: Text("We are managing 100% tax. You should setup tax (%) according to the state",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),)),

            const SizedBox(height: 10,),
            _buildCheckTaxWidget(),
            const SizedBox(height: 30,),
            //check if tax is enabled or not
            Obx((){
                return controller.isTaxStatus.value
                    ? _buildTaxSetupWidget() : Container();
              }
            )

          ],
        ),
      ),
    );
  }

  Container _buildTaxSetupWidget() {
    return Container(
      width: double.infinity,
        padding:const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.textWhite,
          borderRadius: BorderRadius.circular(10)
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text("Tax Setup(%)",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
                hint: "Tax",
                controller: controller.taxController.value,
              textType: TextInputType.number,
            ),
            const SizedBox(height: 20,),
           const Text("State",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(hint: "State", controller: controller.stateController.value),
            const SizedBox(height: 30,),
            Obx((){
                return AppButton(
                    isLoading: controller.isUpdating.value,
                    name: "Save",
                    width: 120,
                    onClick: (){
                      controller.updateTaxAndState();
                    }
                );
              }
            )

          ],
        ),
    );
  }

  Column _buildCheckTaxWidget() {
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //swtich button to enable or disable tax
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(()=> controller.isLoading.value ? const Center(
                    child: CircularProgressIndicator(),
                  ) : Switch(
                    value: controller.isTaxStatus.value,
                    onChanged: (value) {
                      controller.isTaxStatus.value = value;
                      controller.updateTaxStatus();
                    },
                    activeTrackColor: Colors.green,
                    activeColor: Colors.white,
                  )),
                 const  SizedBox(width: 10,),
                 const  Text("Do you head 100% tax?",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.black),),
                  //change tax status and show in text
                ],
              ),
              const SizedBox(height: 10,),
              Obx(()=>Text(controller.isTaxStatus.value
                  ? "Yes!. I will give 100% tax."
                  : "No!. I want to handle tax manually.",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 17,color: Colors.black),))


            ],
          );
  }
}
