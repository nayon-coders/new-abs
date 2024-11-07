import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/view/partner_management/controller/partner_controller.dart';
import 'package:abs_office_management/view/today_sales_management/widget/edit_button.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:abs_office_management/widgets/no_data_find.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../controller/role_managment_controller.dart';
import '../../../routes/route_name.dart';
import '../../../utility/app_color.dart';
import '../../../utility/assetes.dart';

class PartnerManagement extends GetView<PartnerController> {
   PartnerManagement({super.key});
  final RoleManagmentController roleController = Get.find<RoleManagmentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        title: const Text("Partner management",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        actions: [
          Obx(() {
              return roleController.isPartner.value ? Center() : EditButton(
                icon: Icons.add,
                  bgColor: Colors.green,
                  onClick: ()=>Get.toNamed(AppRoute.addPartnerScreen),
              );
            }
          ),
         const SizedBox(width: 20,),
        ],
      ),
      body:Obx((){
        if(controller.isGetting.value){
          return _loadingMethod();
        }else if(controller.getAllPartnerModel.value.data == null || controller.getAllPartnerModel.value.data!.isEmpty){
          return const Center(child: NoDataFoundScreen(),);
        }else{
          return ListView.builder(
              padding:const EdgeInsets.all(10),
              itemCount: controller.getAllPartnerModel.value.data!.length,
              itemBuilder: (context,index){
                final data = controller.getAllPartnerModel.value.data![index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    contentPadding:const EdgeInsets.only(left: 10,right: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    tileColor: Colors.white,
                    leading: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Builder(
                        builder: (context){
                          if(data.profilePic!.isNotEmpty){
                            return  ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                
                                imageUrl: "${AppConfig.DOMAIN}${data.profilePic}",
                                height: 45,
                                width: 45,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    AppShimmerPro.circularShimmer(width: 45, height: 45, borderRadius: 10),
                                errorWidget: (context, url, error) =>const Icon(
                                  Icons.person,
                                  color: Colors.white ,
                                  size: 45,
                                ),
                              ),
                            );
                          }else{
                            return Image.asset(Assets.profilePic, height: 45, width: 45, fit: BoxFit.cover);
                          }
                        },
                      )
                    ),


                    title: Text("${data.name}",style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),

                    subtitle: Text("${data.percentage }%",style:const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.textBlack),),

                    trailing: InkWell(
                        onTap: ()=>Get.toNamed(
                            AppRoute.singlePartnerScreen,
                          arguments: data.id,
                        ),
                        child: const Text("View Details",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xFF1814F3)),)),

                  ),
                ).animate().fade(duration: 500.ms, curve: Curves.easeInOut);;

              });
        }

        }
      )
    );
  }
  Widget _loadingMethod(){
    return ListView.builder(
        itemBuilder: (context,index){
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppShimmerPro.circularShimmer(width: 60, height: 60, borderRadius: 100),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppShimmerPro.circularShimmer(width: 120, height: 10, borderRadius: 10),
                  AppShimmerPro.circularShimmer(width: 200, height: 15, borderRadius: 10),
                ],
              ),

            ],
          );
        });
  }
}
