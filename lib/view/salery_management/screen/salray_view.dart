import 'package:abs_office_management/controller/date_time_controller.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/utility/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/salary_list_model.dart';

class SalrayView extends StatelessWidget {
   SalrayView({super.key});
   
   final DateTimeController dateTimeController = Get.put(DateTimeController());

  SalaryItem salaryItem = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.textBlack,
            size: 20,
          ),
        ),
        title:  Text(
          "${salaryItem.employeeName} : Salary Sheet",
          style:const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.textBlack,
          ),
        ),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding:const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              padding:const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${salaryItem.employeeName!.toUpperCase()}",style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 30,color: AppColors.textBlack),),
                  const SizedBox(height: 10,),

                 const Text("Salary Paid for",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
                 const SizedBox(height: 10,),
                   Text("\$${salaryItem.amount}",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 30,color: AppColors.red),),
                  const SizedBox(height: 30,),
                  Text("${dateTimeController.dateFormat1(DateTime.parse("${salaryItem.date}"))}",style:const  TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
                  const SizedBox(height: 5,),
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.green.withOpacity(0.2),
                      border: Border.all(color: AppColors.green),
                    ),
                    child:const Center(
                      child: Text("Paid",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.green),),
                    ),
                  )

                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration:const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: AppColors.green,
                    ),
                    child: TextButton(
                      onPressed: () {
                        alertDialog(title: "Hold On!", content: "Its preparing for print.", onOk: ()=>Get.back());
                     //   Get.toNamed(AppRoute.addPaidSalary, arguments: salaryItem);
                      },
                      child:const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.print_outlined, color: Colors.white,),
                          SizedBox(width: 10,),
                          const Text("Pay Recipe",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textWhite),),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 20,),
            const Text("** Pay recipe will be generated for the above salary paid.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),),

          ],
        ),
      ),
    );
  }
}
