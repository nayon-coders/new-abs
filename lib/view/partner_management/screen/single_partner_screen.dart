import 'package:abs_office_management/view/partner_management/controller/partner_controller.dart';
import 'package:abs_office_management/view/today_sales_management/widget/edit_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';

class SinglePartnerScreen extends GetView<PartnerController> {
  const SinglePartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments.toString();
    Future.delayed(Duration.zero,()=>controller.singlePartner(id));

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
                return Container(
                  padding:const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(8),
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

                          const SizedBox(height: 5,),
                          Container(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                            decoration:const BoxDecoration(
                                color: Colors.white38
                            ),
                            child:Text("Profit Amount: ${partnerInfo.partnerProfit} ",
                              style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.textWhite),
                            ),
                          ),



                        ],
                      ),

                      //right side
                      Column(
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
                                  child: CachedNetworkImage(
                                    imageUrl:"assets/images/person.png",
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
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 3,
                                right: 1,
                                child: EditButton(

                                  icon: Icons.camera_alt,
                                    onClick: (){}),
                              )
                            ],
                          ),


                        ],
                      )


                    ],
                  ),
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
