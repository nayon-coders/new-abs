
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utility/app_color.dart';

class EmployeePaymentHistory extends StatelessWidget {
  //final List<PaymentHistory>? paymentHistory;
  final String month;
  final String totalPaid;
  final String workingHours;
  final String totalUnPaid;
  final String name;




  const EmployeePaymentHistory({super.key, required this.month, required this.totalPaid, required this.workingHours, required this.totalUnPaid, required this.name});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(text: TextSpan(
                    text: "Month: ",
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColors.textBlack),
                    children: [
                      TextSpan(
                        text: "$month",
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: AppColors.textBlack),
                      ),
                    ]
                )),
                RichText(text: TextSpan(
                    text: "Total Working Hours: ",
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColors.textBlack),
                    children: [
                      TextSpan(
                        text: "$workingHours Hours",
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: AppColors.textBlack),
                      ),
                    ]
                )),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(text: TextSpan(
                        text: "Total Paid: ",
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColors.textBlack),
                        children: [
                          TextSpan(
                            text: "\$$totalPaid",
                            style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: AppColors.textBlack),
                          ),
                        ]
                    )),
                    RichText(text: TextSpan(
                        text: "Total Unpaid: ",
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColors.textBlack),
                        children: [
                          TextSpan(
                            text: "\$$totalUnPaid",
                            style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: AppColors.textBlack),
                          ),
                        ]
                    )),

                  ],
                ),
              ],
            ),
          ),

          // SizedBox(height: 10,),
          // paymentHistory!.isEmpty ? Center(child: EmptyScreen(),) : Expanded(
          //   flex: 2,
          //   child: ListView.builder(
          //     //padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 20),
          //       itemCount: paymentHistory!.length,
          //       itemBuilder: (_,index){
          //         var data = paymentHistory![index];
          //         return InkWell(
          //           onTap: (){
          //             showModalBottomSheet(context: context, builder: (BuildContext context){
          //               return Container(
          //                 padding: EdgeInsets.all(20),
          //                 height: 200,
          //                 width: double.infinity,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
          //                   color: AppColors.bgWhite,
          //                 ),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     SizedBox(height: 10,),
          //                     RichText(text: TextSpan(
          //                         text: "Date: ",
          //                         style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColors.textBlack),
          //                         children: [
          //                           TextSpan(
          //                             text: "${convertUSADate(DateTime.parse("2024-08-01"))}",
          //                             style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: AppColors.textBlack),
          //                           ),
          //                         ]
          //                     )),
          //                     SizedBox(height: 10,),
          //                     RichText(text: TextSpan(
          //                         text: "Pay By: ",
          //                         style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColors.textBlack),
          //                         children: [
          //                           TextSpan(
          //                             text: "${data.payBy}",
          //                             style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: AppColors.textBlack),
          //                           ),
          //                         ]
          //                     )),
          //                     SizedBox(height: 10,),
          //                     data.payBy!.contains("check") ? RichText(text: TextSpan(
          //                         text: "Check No.: ",
          //                         style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColors.textBlack),
          //                         children: [
          //                           TextSpan(
          //                             text: "${data.checkNo}",
          //                             style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: AppColors.textBlack),
          //                           ),
          //                         ]
          //                     )) : Center(),
          //
          //                   ],
          //                 ),
          //               );
          //             });
          //           },
          //           child: Container(
          //             padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          //             margin: EdgeInsets.only(bottom: 5),
          //
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //                 color: AppColors.textWhite,
          //                 border: Border.symmetric(
          //                   vertical: BorderSide.none,
          //                   horizontal: BorderSide(color: Colors.grey.shade200),
          //                 )
          //
          //             ),
          //
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //
          //
          //                 //Date
          //                 Column(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(name.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
          //                     Text("${convertUSADate(DateTime.parse("${data.date!}"))}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: AppColors.textBlack),),
          //                   ],
          //                 ),
          //
          //
          //
          //
          //                 //Hours
          //                 SizedBox(
          //                     width: 100,
          //                     child: Text("\$${data.amount}",
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),)),
          //               ],
          //             ),
          //           ),
          //         );
          //       }),
          // )
        ],
      ),
    );
  }
}
