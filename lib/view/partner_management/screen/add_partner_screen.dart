import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/partner_management/controller/partner_controller.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPartnerScreen extends GetView<PartnerController> {
   AddPartnerScreen({super.key});
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title:  Text(controller.isEditing.value?"Edit Partner":"Add Partner",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
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

              //partner Name
              const Text("Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
              const SizedBox(height: 10,),
              AppInput(
                hint: "Name",
                controller: controller.name.value,
                textType: TextInputType.name,
                fillColor: AppColors.textWhite,
              ),
              const SizedBox(height: 20,),

              //partner email
              const Text("Email",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
              const SizedBox(height: 10,),
              AppInput(
                hint: "Email",
                controller: controller.email.value,
                textType: TextInputType.emailAddress,
                fillColor: AppColors.textWhite,
              ),
              const SizedBox(height: 20,),

              //partner phone
              const Text("Phone",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
              const SizedBox(height: 10,),
              AppInput(
                hint: "Phone",
                controller: controller.phone.value,
                textType: TextInputType.phone,
                fillColor: AppColors.textWhite,
              ),
              const SizedBox(height: 20,),

              //partner password
              controller.isEditing.value?Center(): const Text("Password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
              controller.isEditing.value?Center():const SizedBox(height: 10,),
             controller.isEditing.value?Center(): AppInput(
                hint: "Password",
                controller: controller.password.value,
                textType: TextInputType.visiblePassword,
                fillColor: AppColors.textWhite,
              ),
              controller.isEditing.value?Center(): const SizedBox(height: 20,),

              //partner partner percent
              const Text("Partner Percent",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
              const SizedBox(height: 10,),
              AppInput(
                hint: "0.00",
                controller: controller.percent.value,
                textType: TextInputType.number,
                fillColor: AppColors.textWhite,
              ),
              const SizedBox(height: 30,),

              Center(child: AppButton(
                isLoading: controller.isAdding.value,
                  name:controller.isEditing.value?"Update": "Save",
                  bgColor: controller.isEditing.value?Colors.orange:AppColors.mainColor,
                  onClick: (){
                  if(_key.currentState!.validate()){
                    if(controller.isEditing.value){
                      controller.editPartner(controller.id.value);
                      controller.singlePartner(controller.id.toString());

                    }else{
                      controller.addPartner();
                    }

                  }
                  }))




            ],
          ),
        ),
      ),
    );
  }
}
