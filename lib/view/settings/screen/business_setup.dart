import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/assetes.dart';

class BusinessSetup extends StatelessWidget {
   BusinessSetup({super.key});
  final _businessName = TextEditingController();
  final _email = TextEditingController();
  final _personalName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title:const  Text("Business Setup",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding:const  EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            //profile Pic
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColors.textindico)
                    ),
                    child: Center(child: Image.asset(Assets.profilePic,height: 120,width: 120,fit: BoxFit.cover,)),
                  ),

                  //edit button
                  
                  Positioned(
                    right: -5,
                    bottom: 10,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.indigo,
                        ),
                        child:const Center(child:  Icon(Icons.edit,color: AppColors.textWhite,size: 17,)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 20,),
            const Text("Business Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
              hint: "Business Name",
              fillColor: AppColors.textWhite,
              textType: TextInputType.name,
              hintColor: AppColors.textindico,
              controller: _businessName,
            ),

            const SizedBox(height: 20,),
            const Text("Personal Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
              hint: "Name",
              fillColor: AppColors.textWhite,
              textType: TextInputType.name,
              hintColor: AppColors.textindico,
              controller: _personalName,
            ),

            const SizedBox(height: 20,),
            const Text("Email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
              hint: "Email",
              fillColor: AppColors.textWhite,
              textType: TextInputType.emailAddress,
              hintColor: AppColors.textindico,
              controller: _email,
            ),

            const SizedBox(height: 20,),
            const Text("Phone Number",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
              hint: "Phone Number",
              fillColor: AppColors.textWhite,
              textType: TextInputType.number,
              hintColor: AppColors.textindico,
              controller: _phoneNumber,
            ),

            const SizedBox(height: 20,),
            const Text("Business Address",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            const SizedBox(height: 10,),
            AppInput(
              hint: "Business Address",
              fillColor: AppColors.textWhite,
              hintColor: AppColors.textindico,
              maxLine: 4,
              controller: _address,
            ),

           const SizedBox(height: 30,),

            Center(child: AppButton(
                name: "Save",
                onClick: (){},
            ),
            ),
            const SizedBox(height: 30,),


          ],
        ),
      ),

    );
  }
}
