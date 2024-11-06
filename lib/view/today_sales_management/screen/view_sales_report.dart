import 'package:abs_office_management/data/model/all_sales_molde.dart';
import 'package:abs_office_management/utility/app_color.dart';
import 'package:abs_office_management/view/today_sales_management/controller/sales_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewSalesReport extends GetView<SalesController> {
   ViewSalesReport({super.key});

   SingleSalesDatum singleSalesDatum = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading:IconButton(
            onPressed: (){
              Get.back();
            },
            icon:const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,)),
        title: const Text("View Sales Report",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColors.textWhite),),
      ),

      body: Builder(
        builder: (_){
          var totalOnlineSales = double.parse("${singleSalesDatum.onlineSales!.map((e)=> double.parse(e.amount!.toString())).reduce((a,b)=> a+b)}");
          var netSales = (double.parse("${singleSalesDatum.salesRegister}")) - (double.parse("${singleSalesDatum.tax}") + double.parse("${singleSalesDatum.soOv}"));
          var extraIncome = double.parse("${singleSalesDatum.additionalIncome}");
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //box
                Container(
                  height: 200,
                  decoration:const BoxDecoration(
                    color: AppColors.mainColor,
                    //  borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Stack(
                    children: [
                      // Positioned(
                      //   top: 50,
                      //   left: 5,
                      //   child: Row(
                      //     children: [
                      //       IconButton(
                      //           onPressed: (){
                      //             Get.back();
                      //           },
                      //           icon:const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,)),
                      //      const  Text("View Sales Report",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColors.textWhite),),
                      //     ],
                      //   ),
                      // ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 30,),
                            Text("\$${netSales.toStringAsFixed(2)}",style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                           const Text("Total Net Sale",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),),
                          ],
                        ),
                      ),

                      //show total register sales
                      Positioned(
                        bottom: 0,
                        left: 20,
                        child:  BuildBoxs(
                          bgColor: Colors.green.shade100,
                          title: "Gross Sales",
                          value: singleSalesDatum.salesRegister.toString(),
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 20,
                        child:  BuildBoxs(
                          bgColor: Colors.green.shade100,
                          title: "Online Sales",
                          value: totalOnlineSales.toString(),
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
                       bgColor: Colors.green.shade100,
                       title: "Credit Sales",
                       value: singleSalesDatum.craditeSales.toString(),
                     ),

                     BuildBoxs(
                       bgColor: Colors.green.shade100,
                       title: "Extra Income",
                       value: extraIncome.abs().toStringAsFixed(2),
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
                        bgColor: Colors.red.shade100,
                        title: "Short & Over",
                        value: double.parse("${singleSalesDatum.soOv}").abs().toString(),
                      ),

                      BuildBoxs(
                        bgColor: Colors.red.shade100,
                        title: "Tax",
                        value: double.parse("${singleSalesDatum.tax}").toStringAsFixed(2),
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
                              child: Text("${data.name![0].toUpperCase()}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.mainColor),),
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
    super.key, required this.title, required this.value, this.bgColor  = AppColors.textWhite
  });

  final String title;
  final String value;
  final  Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset:const Offset(0, 30), // Move the container down by 50 pixels
      child: Container(
        height: 100,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("\$${value}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),

           const SizedBox(height: 7,),
            Text("$title",style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
