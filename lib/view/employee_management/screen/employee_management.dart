import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/assetes.dart';
import 'package:abs_office_management/view/employee_management/controller/employee_manage_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utility/app_color.dart';
import '../../../widgets/app_shimmer.dart';

class EmployeeManagement extends GetView<EmployeeManageController> {
  const EmployeeManagement({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
        title:const Text("Employee management",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
        leading: IconButton(onPressed: ()=>Get.back(),
          icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,),
        ),
        actions: [
          InkWell(
            onTap: ()=>Get.toNamed(AppRoute.addEmployeeScreen),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.green,
              ),
              child:const Center(child: Icon(Icons.add,color: Colors.white,),),
            ),
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: Obx(() {
        if (controller.isGetting.value) {
          return _buildLoading();
        }

        if (controller.employeeListModel.value.data == null || controller.employeeListModel.value.data!.isEmpty) {
          return const Center(child: Text("No employees found."));
        }

          return ListView.builder(
            padding:const EdgeInsets.all(10),
            itemCount: controller.employeeListModel.value.data!.length,
              itemBuilder: (context,index){
              final data = controller.employeeListModel.value.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding:const EdgeInsets.only(left: 10,right: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    tileColor: Colors.white,
                    leading: Container(
                      height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: data.profilePic != null && data.profilePic!.isNotEmpty?ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                                imageUrl: "${AppConfig.DOMAIN}${data.profilePic!}",
                                height: 40, width: 40, fit: BoxFit.cover,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => const Icon(Icons.error),),
                          )

                              : Image.asset(Assets.profilePic, height: 40, width: 40, fit: BoxFit.cover),
                        ),
                    ),


                    title: Text(data.name.toString(),style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),

                    subtitle: Text(data.employeePosition.toString(),style:const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.textBlack),),

                    trailing: InkWell(
                      onTap: ()=>Get.toNamed(
                          AppRoute.singleEmployeeScreen,
                        arguments: data.id,
                      ),
                        child: const Text("View Details",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xFF1814F3)),)),

                  ),
                );

          });
        }
      ),
    );
  }

  //loading shimmer
  Widget _buildLoading() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context,index){
        return AppShimmerPro.circularShimmer(width: double.infinity, height: 60, borderRadius: 10);
      },
    );
  }
}
