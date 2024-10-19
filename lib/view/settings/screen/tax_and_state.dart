import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';

class TaxAndState extends StatelessWidget {
  const TaxAndState({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.textWhite,
        title:const Text("Tax & State",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        leading: IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: 350,
                child: Text("We are managing 100% tax. You should setup tax (%) according to the state",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),)),

            const SizedBox(height: 10,),

          ],
        ),
      ),
    ));
  }
}
