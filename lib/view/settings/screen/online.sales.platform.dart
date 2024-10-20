import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/settings/controller/online.sales.platform.controller.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:abs_office_management/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OnlineSalesPlatform extends GetView<OnlineSalesPlatformController> {
  const OnlineSalesPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.textWhite,
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios)),
        title:const Text("Online Sales Platform"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _addOnlineSalesPlatfor(),
           const SizedBox(height: 20,),
            //list of online sales platform
            Obx(() {
              if(controller.isGetting.value){
                return _buildLoading();
              }else{
                return _buildDataListView();
              }
            })
          ],
        ),
      )

    );
  }

  //getting the list of online sales platform
  Expanded _buildDataListView() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.onlineSalesPlatformModel.value.data!.length,
        itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffFFE0EB),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Center(
                  child: Text(controller.onlineSalesPlatformModel.value.data![index].name![0].toUpperCase(),style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
                ),
              ),
              title: Text(controller.onlineSalesPlatformModel.value.data![index].name!, style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
              trailing: Obx((){
                  return IconButton(
                    icon: controller.isDeleting.value ?const CircularProgressIndicator.adaptive(backgroundColor: Colors.red,) : const Icon(Icons.delete, color: Colors.red,),
                    onPressed: ()=> controller.deleteOnlineSalesPlatform(controller.onlineSalesPlatformModel.value.data![index].id.toString()),
                  );
                }
              ),
            ),
          );
        },
      ),
    );
  }


  //loading shimmer
  Expanded _buildLoading() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context,index){
          return AppShimmerPro.circularShimmer(width: double.infinity, height: 40, borderRadius: 10);
        },
      ),
    );
  }


  //add online sales platform
  Column _addOnlineSalesPlatfor() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //text to introduce the page
        const Text("You can manage you online sales platform. List all the online platforms you use.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.textBlack),),
        const SizedBox(height: 20,),
        //input field
        const Text("Online Sales Platform",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        const SizedBox(height: 10,),
        AppInput(hint: "Platform Name", fillColor: Colors.white, controller: controller.platformName.value),
        const SizedBox(height: 20,),
        Obx(() {
            return AppButton(
              width: 140,
              isLoading: controller.isAdding.value,
                name: "Save",
                onClick: ()=> controller.addOnlineSalesPlatform()
            );
          }
        )

      ],
    );
  }
}
