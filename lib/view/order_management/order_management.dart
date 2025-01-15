import 'package:abs_office_management/utility/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utility/assetes.dart';
import '../dashboard_screen/widget/menu_box.dart';

class OrderManagement extends StatelessWidget {
  OrderManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios)),
        title:const Text("Order Management",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Coming soon ..",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
            const SizedBox(height: 20,),

            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menubox.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 150
                ), itemBuilder: (context,index){
              final data = menubox[index];
              return MenuBox(
                name: data["name"],
                image: data["image"],
                onClick:()=>Get.toNamed(data["screen"]),
              );
            })

          ],
        ),
      ),
    );
  }

  List<Map<String,dynamic>> menubox=[
    {"name": "Restaurant Depot","image": Assets.resDepot,"screen":(){}},
    {"name": "Sysco","image": Assets.sysco,"screen": (){}},
    {"name": "US Foods","image": Assets.usFood,"screen":(){}},
    {"name": "Hackney Whole Sale","image": Assets.hackney,"screen": (){}},
    {"name": "Afgan Food","image": Assets.afgan,"screen": (){}},
    {"name": "Pamir","image": Assets.pamir,"screen": (){}},


  ];
}
