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
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: const Text('View Sales Report'),
      // ),

      body: Builder(
        builder: (_){
          var netSales = double.parse("${singleSalesDatum.salesRegister}") - (double.parse("${singleSalesDatum.tax}") + double.parse("${singleSalesDatum.soOv}"));
          var totalOnlineSales = singleSalesDatum.onlineSales!.map((e)=> double.parse(e.amount!.toString())).reduce((a,b)=> a+b);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //box
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  //  borderRadius: BorderRadius.circular(10),
                ),
                child:  Stack(
                  children: [
                    Positioned(
                      top: 60,
                      left: 20,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,)),
                          Text("View Sales Report",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColors.textWhite),),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("\$${netSales.toStringAsFixed(2)}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text("Total Gross Sale",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),),
                        ],
                      ),
                    ),

                    //show total register sales
                    Positioned(
                      bottom: 0,
                      left: 20,
                      child:  BuildBoxs(
                        title: "Register Sales",
                        value: singleSalesDatum.salesRegister.toString(),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 20,
                      child:  BuildBoxs(
                        title: "Online Sales",
                        value: totalOnlineSales.toString(),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("Online Sales", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
              //box
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(

                    itemCount: singleSalesDatum.onlineSales!.length,
                    itemBuilder: (_, index){
                      var data = singleSalesDatum.onlineSales![index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
                              child: Text("${data.name![0].toUpperCase()}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.mainColor),),
                            ),
                          ),
                          title: Text("${data.name}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                          trailing: Text("\$${data.amount}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        )
                      );
                    },
                  ),
                ),
              )

            ],
          );
        },
      ),
    );
  }
}

class BuildBoxs extends StatelessWidget {
  const BuildBoxs({
    super.key, required this.title, required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 30), // Move the container down by 50 pixels
      child: Container(
        height: 100,
        width: Get.width*.43,
        padding: EdgeInsets.all(10),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("\$${value}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),

            SizedBox(height: 7,),
            Text("$title",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
