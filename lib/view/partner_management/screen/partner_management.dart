import 'package:abs_office_management/view/today_sales_management/widget/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utility/app_color.dart';
import '../../../utility/assetes.dart';

class PartnerManagement extends StatelessWidget {
  const PartnerManagement({super.key});

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
          EditButton(
            icon: Icons.add,
              bgColor: Colors.green,
              onClick: (){}),
         const SizedBox(width: 20,),
        ],
      ),
      body:ListView.builder(
          padding:const EdgeInsets.all(10),
          itemCount: 10,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
                  child:Image.asset(Assets.profilePic, height: 45, width: 45, fit: BoxFit.cover),
                ),


                title: Text("Name",style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),

                subtitle: Text("Partner ship",style:const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.textBlack),),

                trailing: InkWell(
                    onTap: (){},
                    child: const Text("View Details",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xFF1814F3)),)),

              ),
            );

          })
    );
  }
}
