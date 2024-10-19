import 'package:abs_office_management/routes/route_name.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/settings/setting_screen.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEmployeePositionView extends StatelessWidget {
   AddEmployeePositionView({super.key});
  final _employeePosition = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title:const Text("Add Employee Position",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        leading: IconButton(onPressed: ()=>Get.to(()=>SettingScreen()), icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
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
              controller: _employeePosition,
              textType: TextInputType.name,
            ),
            
            const SizedBox(height:30,),
            AppButton(
                name: "Save",
                width: 130,
                onClick: (){}
            ),


            //list of employee Position
            const SizedBox(height: 20,),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                      child: Center(child: Text("F",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),)),
                    ),
                    title: Text("Position Name",
                      style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),
                    ),
                    trailing:const Text("Delete",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.red),),
                  ),
                );

            })


            
            
        
          ],
        ),
      ),
    );
  }
}
