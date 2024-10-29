import 'package:abs_office_management/controller/image_picker_controller.dart';
import 'package:abs_office_management/utility/app_const.dart';
import 'package:abs_office_management/view/partner_management/controller/partner_controller.dart';
import 'package:abs_office_management/view/today_sales_management/widget/edit_button.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app_config.dart';
import '../../../utility/app_color.dart';

class SinglePartnerScreen extends GetView<PartnerController> {
   SinglePartnerScreen({super.key});

  //image picker controller init
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments.toString();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
     controller.singlePartner(id);
    });

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        title: const Text("Partner Info",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.white,
        actions: [
          EditButton(
            icon: Icons.edit,
            bgColor: Colors.yellow,
            onClick: (){},
          ),
          const SizedBox(width: 10,),
          EditButton(
            icon: Icons.delete,
              bgColor: Colors.red,
              onClick: (){},
          ),
          const SizedBox(width: 20,),
        ],
      ),
      body: SingleChildScrollView(
        padding:const  EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Obx((){
              if(controller.isGetting.value){
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }else if(controller.singlePartnerModel.value.partnerInfo == null){
                return Text("empty");

              }else{
                final partnerInfo = controller.singlePartnerModel.value.partnerInfo!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height:200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Loss & Profit",
                            style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.textBlack),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  // color: Colors.red.withOpacity(0.2),
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.green,
                                        width: 1,
                                      ),
                                    )
                                ),
                                child: Column(
                                  children: [
                                    Text("\$${controller.singlePartnerModel.value.wholeBusiness!.totalProfit!.toStringAsFixed(2)}",
                                      style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColors.mainColor),
                                    ),
                                    Text("Total Profit",
                                      style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.mainColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text("\$${controller.singlePartnerModel.value.wholeBusiness!.totalLoss!.toStringAsFixed(2)}",
                                      style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColors.red),
                                    ),
                                    Text("Total Loss",
                                      style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.red),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          //left side
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name: ${partnerInfo.name}",style:const  TextStyle(fontWeight: FontWeight.w600,fontSize: 17,color: AppColors.textWhite),),
                              const  SizedBox(height: 10,),
                              Text("Phone: ${partnerInfo.phone} ",style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.textWhite),),
                              const SizedBox(height: 2,),
                              Text("Email: ${partnerInfo.email}",style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.textWhite),),
                              const SizedBox(height: 30,),

                              const  Text("Type: Partner ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.textWhite),),
                              const SizedBox(height: 5,),
                              Text("Profit percentage: ${partnerInfo.percentage}%",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.textWhite),),

                            ],
                          ),

                          //right side
                          SizedBox(
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                //Text("Business ID: ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.textWhite),),
                                const SizedBox(height: 5,),
                                Text("ID: ${partnerInfo.id} ",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: AppColors.textWhite),),
                                const SizedBox(height: 5,),
                                Stack(
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.none,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Center(
                                        child: Obx(() {
                                          if(imagePickerController.selectedImage.value != null){
                                            return Image.file(imagePickerController.selectedImage.value!,
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            );
                                          }else if(partnerInfo.profilePic!.isNotEmpty){
                                            return CachedNetworkImage(
                                              imageUrl: "${AppConfig.DOMAIN}${partnerInfo.profilePic}",
                                              height: 110,
                                              width: 110,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  AppShimmerPro.circularShimmer(width: 100, height: 100, borderRadius: 10),
                                              errorWidget: (context, url, error) =>const Icon(
                                                Icons.person,
                                                color: Colors.white ,
                                                size: 120,
                                              ),
                                            );
                                          }else{
                                            return CachedNetworkImage(
                                              imageUrl: "assets/images/person.png",
                                              height: 110,
                                              width: 110,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget: (context, url, error) =>const Icon(
                                                Icons.person,
                                                color: Colors.white ,
                                                size: 120,
                                              ),
                                            );
                                          }

                                          }
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 3,
                                      right: 1,
                                      child: EditButton(
                                        //  isLoading: true,
                                          icon: Icons.camera_alt,
                                          onClick: (){
                                            imagePickerController.selectedImage.value = null;
                                            chooseImageSource(
                                              context: context,
                                              onCamera: (){

                                                imagePickerController.pickImage(ImageSource.camera);
                                                Get.back();
                                              },
                                              onGallery: (){
                                                // imagePickerController.selectedImage.value = null;
                                                imagePickerController.pickImage(ImageSource.gallery);
                                                Get.back();
                                              },
                                            );
                                          }
                                          ),
                                    )
                                  ],
                                ),




                              ],
                            ),
                          )


                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    Obx(() {
                      return imagePickerController.selectedImage.value != null ? Center(
                        child: AppButton(
                          isLoading: controller.isUpdateProfile.value,
                            name: "Upload",
                            onClick: ()async{
                             await controller.updatePartnerProfile(partnerInfo.id.toString(), imagePickerController.selectedImage.value!).then((e){
                                imagePickerController.selectedImage.value = null;
                             });

                            }
                        ),
                      ) : Center();
                    }
                    )

                  ],
                );
              }

              }
            ),

          ],
        ),

      ),
    );
  }


}
