import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/settings/controller/admin_password_update_controller.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends GetView<AdminUpdateController> {
   ChangePassword({super.key});
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon:const  Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        title:const Text("Change Password",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 20,),
              const Text("Current Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
              const SizedBox(height: 10,),
              AppInput(
                  hint: "Current Password",
                  fillColor: AppColors.textWhite,
                  hintColor: AppColors.textindico,
                  textType: TextInputType.visiblePassword,
                  controller: controller.oldPass.value
              ),

              const SizedBox(height: 20,),
              const Text("New Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
              const SizedBox(height: 10,),

              AppInput(
                  hint: "New Password",
                  fillColor: AppColors.textWhite,
                  hintColor: AppColors.textindico,
                  textType: TextInputType.visiblePassword,
                  controller: controller.newPass.value
              ),

              const SizedBox(height: 20,),
              const Text("Confirm Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
              const SizedBox(height: 10,),

              AppInput(hint: "Confirm Password",
                  fillColor: AppColors.textWhite,
                  hintColor: AppColors.textindico,
                textType: TextInputType.visiblePassword,
                  controller: controller.confirmPass.value,
              ),

              const SizedBox(height: 30,),
              Center(
                child: Obx(() {
                    return AppButton(
                      isLoading: controller.isUpdate.value,
                        name: "Save",
                        onClick: (){
                          if(_key.currentState!.validate()){
                            if(controller.newPass.value.text == controller.confirmPass.value.text){
                              controller.adminChangePassword();
                            }else{
                              Get.snackbar("Failed", "Passwords do not match",backgroundColor: Colors.red);
                            }


                          }
                        },
                    );
                  }
                ),
              ),

              const SizedBox(height: 30,),



            ]
          ),
        ),
      ),
    );
  }
}
