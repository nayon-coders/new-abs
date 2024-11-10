import 'package:abs_office_management/controller/amount_formate.dart';
import 'package:abs_office_management/data/model/all_sales_molde.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/today_sales_management/controller/sales_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/assetes.dart';

class ViewSalesReport extends GetView<SalesController> {
   ViewSalesReport({super.key});
   SingleSalesDatum singleSalesDatum = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.calculateAmount(singleSalesDatum);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading:IconButton(
            onPressed: (){
            //  controller.clearCalculateData();
              Get.back();
            },
            icon:const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20,)),
        title: const Text("View Today Sales Report",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.textBlack),),
      ),

      body: Builder(
        builder: (_){
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //box
                Container(
                  height: 200,
                  decoration:const BoxDecoration(
                    color: AppColors.bgColor,
                    //  borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 30,),
                            Text(FormatCurrency.formatCurrency(controller.netSales.toStringAsFixed(2).toString()),style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                           const Text("Total Gross Sale",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                          ],
                        ),
                      ),

                      //show total register sales
                      Positioned(
                        bottom: 0,
                        left: 20,
                        child:  BuildBoxs(
                          image: Assets.foodCost,
                          bgColor: AppColors.textWhite,
                          title: "Inside Sales",
                          value: singleSalesDatum.salesRegister.toString(),
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 20,
                        child:  BuildBoxs(
                          image: Assets.onlineSales,
                          bgColor: AppColors.textWhite,
                          title: "Online Sales", //total online sales
                          value: controller.totalOnlineSales.value.toStringAsFixed(2),
                        ),
                      ),



                    ],
                  ),
                ),
               const SizedBox(height: 20,),
                //show total register sales
               Padding(
                 padding: const EdgeInsets.only(left: 20.0, right: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     BuildBoxs(
                       image: Assets.credit,
                       bgColor: AppColors.textWhite,
                       title: "Credit Sales",
                       value: singleSalesDatum.craditeSales.toString(),
                     ),

                     BuildBoxs(
                       image: Assets.sells,
                       bgColor: AppColors.textWhite,
                       title: "TotalCashCollect",
                       value:double.parse("${singleSalesDatum.totalCashCollect}").toStringAsFixed(2),
                     ),



                   ],
                 ),
               ),
                const SizedBox(height: 20,),

                //show tax & extra income
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      BuildBoxs(
                        image: Assets.tax,
                        bgColor: AppColors.textWhite,
                        title: "Tax",
                        value: double.parse("${singleSalesDatum.tax}").toStringAsFixed(2),
                      ),

                      BuildBoxs(
                        image: Assets.shotOver,
                        bgColor: double.parse("${singleSalesDatum.soOv}") > 0 ? Colors.green.shade50 : Colors.red.shade50,
                        title: "Short & Over",
                        value: double.parse("${singleSalesDatum.soOv}").toString(),
                      ),



                    ],
                  ),
                ),

                const SizedBox(height: 20,),

                //Food cost  & other expanse
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      BuildBoxs(
                        image: Assets.money,
                        bgColor: AppColors.textWhite,
                        title: "Food Cost",
                        value: double.parse("000").toStringAsFixed(2),
                      ),

                      BuildBoxs(
                        image: Assets.extra,
                        bgColor: AppColors.textWhite,
                        title: "Extra Income",
                        value: controller.extraIncome.abs().toStringAsFixed(2),
                      ),

                    ],
                  ),
                ),


                const SizedBox(height: 50,),
               const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("Online Sales", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                //box
                Container(
                  padding:const EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemCount: singleSalesDatum.onlineSales!.length,
                    itemBuilder: (_, index){
                      var data = singleSalesDatum.onlineSales![index];
                      return Container(
                        margin:const EdgeInsets.only(bottom: 10),
                        padding:const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: AppColors.textWhite,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1)
                            )
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(
                              child: Text(data.name![0].toUpperCase(),style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.mainColor),),
                            ),
                          ),
                          title: Text("${data.name}",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                          trailing: Text("\$${data.amount}",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        )
                      );
                    },
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}

class BuildBoxs extends StatelessWidget {
  const BuildBoxs({
    super.key, required this.title, required this.value, this.bgColor  = AppColors.textWhite, required this.image
  });

  final String title;
  final String value;
  final  Color bgColor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset:const Offset(0, 30), // Move the container down by 50 pixels
      child: Container(
        height: 90,
        width: Get.width*.43,
        padding:const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1)
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              padding:const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: bgColor,
              ),
              child: Center(child: Image.asset(image,height: 40,width: 40,fit: BoxFit.cover,)),
            ),
            const SizedBox(width: 5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                const SizedBox(height: 5,),
                Text(FormatCurrency.formatCurrency(value),style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black),),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
