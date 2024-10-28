import 'package:abs_office_management/utility/app_const.dart';
import 'package:abs_office_management/view/salery_management/controller/salary_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/date_time_controller.dart';
import '../../../data/model/salary_list_model.dart';
import '../../../routes/route_name.dart';
import '../../../utility/app_color.dart';
import '../../../utility/assetes.dart';
import '../../../widgets/app_shimmer.dart';
import '../../today_sales_management/widget/edit_button.dart';

class SalaryManagement extends GetView<SalaryManagementController> {
   SalaryManagement({super.key});
   final dateTimeController = Get.put(DateTimeController());






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(),
          icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,size: 20,),),
        title:const Text("Salary management",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: ()=>Get.toNamed(AppRoute.addPaidSalary),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.green
              ),
              child: const Center(child: Icon(Icons.add,color: Colors.white,)),
            ),
          ),
         const SizedBox(width: 20,),
        ],

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20,right: 20),
            height: 60,
            width: double.infinity,

            color: AppColors.bgColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(DateFormat("MMM, yyyy").format(dateTimeController.selectedDate.value),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
                InkWell(
                  onTap: ()async{
                   await dateTimeController.pickDate(context);
                   controller.getAllSalary(dateTimeController.month, dateTimeController.year);

                  },
                    child: Image.asset(Assets.calander,height: 35,width: 35,fit: BoxFit.cover,)),
              ],
            ),
          ),
         const SizedBox(height: 10,),
          Expanded(
            child: Obx(() {
              if(controller.salaryList.isEmpty){
                if(controller.isGetting.value){
                  return  _buildLoading();
                }else{
                  return const Center(child: Text("No salary data found"));
                }
              }else{
                return ListView.builder(
                    itemCount: controller.salaryList.length ?? 0,
                    itemBuilder: (context,index){
                      final data = controller.salaryList![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(

                            tileColor: AppColors.textWhite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${data.employeeName}",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: AppColors.textBlack),),
                                const SizedBox(height: 6,),
                                Text(DateFormat("MM-dd-yyyy").format(DateTime.parse(data.date!)),style:const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),),
                              ],
                            ),
                            trailing: SizedBox(
                              width: 110,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  EditButton(
                                      icon: Icons.edit,
                                      bgColor: Colors.amber,
                                      onClick: (){
                                        controller.setSalaryData(data);
                                      }
                                  ),
                                  EditButton(
                                      icon: Icons.remove_red_eye,
                                      bgColor: AppColors.mainColor,
                                      onClick: (){
                                        //controller.setDataForEditCostingList(data);
                                        // Get.toNamed(AppRoute.addCosting);
                                      }
                                  ),
                                  EditButton(
                                      icon: Icons.delete,
                                      bgColor: AppColors.red,
                                      onClick: (){
                                        //alert
                                        alertDialog(
                                            title: "Hold On!",
                                            content: "Are you sure you want to delete this salary?",
                                            onOk: ()=> controller.deleteSalary(data.id!)
                                        );

                                      }
                                  ),

                                ],
                              ),
                            )
                        ),
                      );

                    });
              }
            }
            ),
          )

        ],
      ),
    );
  }
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