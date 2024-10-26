import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/settings/controller/employee_position_controller.dart';
import 'package:abs_office_management/view/settings/setting_screen.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_shimmer.dart';

class AddEmployeePositionView extends GetView<EmployeePositionController> {
   AddEmployeePositionView({super.key});
   final _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title:const Text("Add Employee Position",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
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

              //add employee position
              _addEmployeePositionPart(),

              //list of employee Position
              const SizedBox(height: 20,),
             Obx((){
               if(controller.isGetting.value){
                 return _appShimmer();
               }else{
                 if(controller.positionModel.value.data == null || controller.positionModel.value.data!.isEmpty){
                   return const Padding(
                     padding: EdgeInsets.only(top: 20),
                     child: Center(
                       child: Text(
                         "No positions available",
                         style: TextStyle(fontSize: 16, color: AppColors.textBlack),
                       ),
                     ),
                   );
                 }else{
                   return _getPosition();
                 }

               }
             })

            ],
          ),
        ),
      ),
    );
  }


  //---add Employee Position----
  Column _addEmployeePositionPart(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 350,
          child:  Text("Add the positions of the employees you have first. So that you can use C employee management.",
            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),
          ),
        ),

        const SizedBox(height: 20,),
        const Text("Position name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
        const SizedBox(height: 10,),
        AppInput(
          hint: "Employee Position",
          fillColor: AppColors.textWhite,
          controller:controller.positionName.value,
          textType: TextInputType.name,
        ),

        const SizedBox(height:30,),
        Obx((){
            return AppButton(
              isLoading: controller.isAdding.value,
                name: "Save",
                width: 130,
                onClick: (){
                if(_key.currentState!.validate()){
                  controller.addEmployeePosition();
                }
                },
            );
          }
        ),

      ],
    );
  }

  //Get the list of employee position
  SizedBox _getPosition(){
    return SizedBox(
        child:ListView.builder(
            itemCount: controller.positionModel.value.data!.length,
            shrinkWrap:true ,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.only(left: 10,right: 10),
                  tileColor: AppColors.textWhite,
                  leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color:const Color(0xFFFFE0EB),
                    ),
                    child: Center(child: Text(controller.positionModel.value.data![index].name![0].toUpperCase(),
                      style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),)),
                  ),
                  title: Text(controller.positionModel.value.data![index].name.toString(),
                    style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),
                  ),
                  trailing:Obx((){
                    return InkWell(
                        onTap: ()=>controller.deletePosition(controller.positionModel.value.data![index].id.toString()),
                        child: controller.isDeleting.value?const CircularProgressIndicator.adaptive(backgroundColor: Colors.red,) :const Text("Delete",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.red),));
                  }
                  ),
                ),
              );

            })
    );

  }

  //shimmer
  SizedBox _appShimmer(){
    return SizedBox(child: ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context,index){
        return AppShimmerPro.circularShimmer(width: double.infinity, height: 40, borderRadius: 10);
      },
    ));
  }




}
