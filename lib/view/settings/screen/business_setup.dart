import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widgets/selected_picker.dart';
import '../controller/admin_password_update_controller.dart';

class BusinessSetup extends GetView<AdminUpdateController> {
   BusinessSetup({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title:const  Text("Business Setup",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding:const  EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            //profile Pic
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColors.textindico)
                    ),
                    child: Center(child: controller.selectedImage != null
                        ? Image.file(controller.selectedImage!, height: 120, width: 120, fit: BoxFit.cover)
                        : Image.network("${AppConfig.DOMAIN}/${controller.singelmodel.value.profilePic}" ?? "default_image_url", height: 120, width: 120, fit: BoxFit.cover),),
                  ),

                  //edit button
                  
                  Positioned(
                    right: -5,
                    bottom: 10,
                    child: InkWell(
                      onTap: (){
                        SelectPicker.showImageBottomSheet(
                            context: context,
                            onCamera: (){
                              controller.pickImage(ImageSource.camera);
                              Get.back();
                            },
                            onGallery: (){
                              controller.pickImage(ImageSource.gallery);
                              Get.back();
                            }
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.indigo,
                        ),
                        child:const Center(child:  Icon(Icons.edit,color: AppColors.textWhite,size: 17,)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 20,),
            const Text("Business Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
              hint: "Business Name",
              fillColor: AppColors.textWhite,
              textType: TextInputType.name,
              hintColor: AppColors.textindico,
              controller: controller.businessName.value,
            ),

            const SizedBox(height: 20,),
            const Text("Personal Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
              hint: "Name",
              fillColor: AppColors.textWhite,
              textType: TextInputType.name,
              hintColor: AppColors.textindico,
              controller: controller.name.value,
            ),
            const SizedBox(height: 20,),
            const Text("Phone Number",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
              hint: "Phone Number",
              fillColor: AppColors.textWhite,
              textType: TextInputType.number,
              hintColor: AppColors.textindico,
              controller: controller.phone.value,
            ),

            const SizedBox(height: 20,),
            const Text("Business Address",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
              hint: "Business Address",
              fillColor: AppColors.textWhite,
              hintColor: AppColors.textindico,
              maxLine: 4,
              controller: controller.businessAddress.value,
            ),

           const SizedBox(height: 30,),

            Center(child: Obx(() {
                return AppButton(
                  isLoading: controller.isLoading.value,
                    name: "Save",
                    onClick: (){
                    controller.adminBusinessSetup();
                    },
                );
              }
            ),
            ),
            const SizedBox(height: 30,),


          ],
        ),
      ),

    );
  }
}
