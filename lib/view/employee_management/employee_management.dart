import 'package:abs_office_management/utility/assetes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_color.dart';

class EmployeeManagement extends StatelessWidget {
  const EmployeeManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
            onTap: (){},
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
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 10,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 10,right: 10),
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
                    child: Center(child: Image.asset(Assets.profilePic,height: 40,width: 40,fit: BoxFit.cover,))),
                title: Text("Employee Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
                subtitle: Text("Manager",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.textBlack),),
                trailing: InkWell(
                  onTap: (){},
                    child: const Text("View Details",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xFF1814F3)),)),

              ),
            );

      }),
    ));
  }
}
