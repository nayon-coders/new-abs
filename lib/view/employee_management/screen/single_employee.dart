import 'package:abs_office_management/view/employee_management/controller/employee_manage_controller.dart';
import 'package:abs_office_management/view/employee_management/controller/tab_controller.dart';
import 'package:abs_office_management/view/employee_management/widget/card_menus.dart';
import 'package:abs_office_management/view/employee_management/widget/working_hours.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_config.dart';
import '../../../routes/route_name.dart';
import '../../../utility/app_color.dart';
import '../../../utility/assetes.dart';
class SingleEmployee extends GetView<EmployeeManageController> {
   SingleEmployee({super.key});
  final tabController = Get.put(ToggleTabController());

  @override
  Widget build(BuildContext context) {
    final employeeId = Get.arguments.toString();
    Future.delayed(Duration.zero,()=>controller.getSingleEmployee(employeeId));

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        title:const Text("Single Employee",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: (){},
            child:Container(
              height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.orange,
                ),
                child: const  Icon(Icons.edit,color: Colors.white,size: 18,)),
          ),
          const SizedBox(width: 15,),
          InkWell(
            onTap: (){
              Get.defaultDialog(
                title: "Confirm delete",
                middleText: "Are you sure you want to delete employee?",
                textConfirm: "Yes",
                textCancel: "No",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  controller.deleteEmployee(controller.singleModel.value.employee!.id.toString());
                },
                onCancel: () {
                  Get.toNamed(AppRoute.singleEmployeeScreen);
                },
              );
            },
              child:Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red,
                  ),
                  child: const  Icon(Icons.delete,color: Colors.white,size: 18,))),
          const SizedBox(width: 20,),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if(controller.isGetting.value){
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }
          if(controller.singleModel.value.employee == null){
            return const Center(child: Text("No data found"),);

          }
            return Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height*0.50,
                      width: double.infinity,
                      color: AppColors.mainColor,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          //profile pic
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child:Center(
                              child: controller.singleModel.value.employee!.profilePic != null && controller.singleModel.value.employee!.profilePic!.isNotEmpty?ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  imageUrl: "${AppConfig.DOMAIN}${controller.singleModel.value.employee!.profilePic!}",
                                  height: 100, width: 100, fit: BoxFit.cover,
                                  placeholder: (context, url) => const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),),
                              )

                                  : Image.asset(Assets.profilePic, height: 100, width: 100, fit: BoxFit.cover),
                            ),
                          ),

                          const SizedBox(height: 10,),
                          Text(controller.singleModel.value.employee!.name.toString()??"",style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textWhite),),
                         const SizedBox(height: 3,),
                          Text(controller.singleModel.value.employee!.email.toString()??"",style:const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.textWhite),),
                          const SizedBox(height: 3,),
                          Text(controller.singleModel.value.employee!.employeePosition.toString()??"",style:const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.textWhite),),
                          const SizedBox(height: 3,),
                          Text("Work: ${controller.singleModel.value.employee!.salaryType.toString()??""}",style:const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.textWhite),),
                          const SizedBox(height: 3,),
                          Text("Rate: \$${controller.singleModel.value.employee!.salaryRate.toString()??""}",style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.textWhite),),
                          const SizedBox(height: 3,),


                        ],
                      ) ,
                    ),

                    Positioned(
                      bottom: -15,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CardMenus(workingName: "Salary  Pending", number: "\$2352.90"),
                          CardMenus(workingName: "Total Paid", number: "\$2352.90"),
                          CardMenus(workingName: "Working Hours", number: "34:67 h"),

                        ],
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 50,),

            ///-----Tab Button: Working Hours & Payment History--------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  InkWell(
                    onTap: () {
                      tabController.toggleTab(true);
                    },
                    child: Obx(() => Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:AppColors.mainColor),
                        color: tabController.isShow.value
                            ? AppColors.mainColor
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Working Hours",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: tabController.isShow.value
                                ? Colors.white
                                : AppColors.mainColor,
                          ),
                        ),
                      ),
                  )),
                ),
                InkWell(
                  onTap: () {
                    tabController.toggleTab(false);
                  },
                  child: Obx(() => Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:AppColors.mainColor),
                      color: tabController.isShow.value
                          ? Colors.white
                          : AppColors.mainColor,
                    ),
                    child: Center(
                      child: Text(
                        "Payment History",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: tabController.isShow.value
                              ? AppColors.mainColor
                              : Colors.white,
                        ),
                      ),
                    ),
                  )),
                ),
              ],
            ),

                // Working hour list & Payment history
                const SizedBox(height: 30,),
                Obx(()=>tabController.isShow.value ?
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 16,
                    itemBuilder: (context,index){
                  return  WorkingHours(dateTime: "12 Jan, 2024", hours: "09:34", onClick: (){});
                 }):const Center(child: Text("Employee Payment history "),),
                ),



              ],
            );
          }
        ),
      ),
    );
  }
}
