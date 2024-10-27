import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/route_name.dart';
import '../../../utility/app_color.dart';
import '../../../utility/assetes.dart';

class SalaryManagement extends StatelessWidget {
  const SalaryManagement({super.key});

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
               const Text("Select Month",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
                InkWell(
                  onTap: (){},
                    child: Image.asset(Assets.calander,height: 35,width: 35,fit: BoxFit.cover,)),
              ],
            ),
          ),
         const SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
                itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: (){
                      Get.bottomSheet(
                        Container(
                          padding:const EdgeInsets.all(15),
                          height: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                            color: AppColors.textWhite,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text("Total pay salary this month",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
                                trailing: Text("\$3435",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.green),),
                              )

                            ],
                          ),
                        ),
                      );
                    },
                    tileColor: AppColors.textWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: AppColors.textBlack),),
                        const SizedBox(height: 6,),
                        Text("22-09-2024",style:const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),),
                      ],
                    ),
                    trailing: Text("\$39999",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.green),),
                  ),
                );

            }),
          )

        ],
      ),
    );
  }
}
