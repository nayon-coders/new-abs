
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utility/app_color.dart';
import '../../../utility/assetes.dart';
import '../controller/contact_controller.dart';

class ContactSupport extends GetView<ContactController> {

  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactController());
    return Scaffold(
        backgroundColor: AppColors.bgColor,

        appBar: AppBar(
          backgroundColor: AppColors.textWhite,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
              onPressed: ()=>Get.back(),
              icon:const Icon(Icons.arrow_back_ios,size: 20,color: AppColors.textBlack,)),
          title:const Text("Contact & Support",
            style:  TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack),
          ),

        ),


        body: Obx((){
          if(controller.isLoading.value){
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }
          final data = controller.customerContact.value.data;
          return SingleChildScrollView(
            padding:const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Text("You can get in touch with us through below platforms. "
                    "Out Team will reach out to you as soon as it would be possible.",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),
                ),


               const SizedBox(height: 20,),

                Container(
                  padding:const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.textWhite,
                  ),
                  child:Column(
                    children: [
                     const Text("Customer Support",
                        style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlack),
                      ),
                     const SizedBox(height: 20,),

                      ListTile(
                        onTap: (){
                          launchUrl(Uri(scheme: 'tel',path:data!.phone.toString()));
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.call,color: AppColors.textBlack,),
                        title:const Text("Contact Number",
                          style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.textBlack,fontSize: 14),
                        ),

                      ),
                      ListTile(
                        onTap: (){
                          launchUrl(Uri(
                              scheme: 'mailto',
                              path: data!.email.toString(),
                              query: "sub: support\nbody:how can help you?"
                          ));
                        },
                        contentPadding: EdgeInsets.zero,
                        leading:const Icon(Icons.mail,color: AppColors.textBlack,),
                        title:const Text("Email Address",
                          style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.textBlack,fontSize: 14),
                        ),

                      ),
                    ],
                  ),
                ),
               const SizedBox(height: 30,),
                Container(
                  padding:const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.textWhite,
                  ),
                  child:Column(
                    children: [
                      const Text("Social Media",
                        style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlack),
                      ),
                      const SizedBox(height: 20,),

                      ListTile(
                        onTap: (){
                          launchUrl(Uri.parse(data!.facebook.toString()));
                        },
                        contentPadding: EdgeInsets.zero,
                        leading:Image.asset(Assets.facebook,height: 30,width: 30,),
                        title:const Text("Facebook",
                          style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.textBlack,fontSize: 14),
                        ),

                      ),
                      ListTile(
                        onTap: (){
                          launchUrl(Uri.parse(data!.whatsapp.toString()));
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset(Assets.whatsApp,height: 30,width: 30,),
                        title:const Text("WhatsApp",
                          style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.textBlack,fontSize: 14),
                        ),

                      ),
                      ListTile(
                        onTap: (){
                          launchUrl(Uri.parse(data!.instagram.toString()));
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset(Assets.instagram,height: 30,width: 30,),
                        title:const Text("Instagram",
                          style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.textBlack,fontSize: 14),
                        ),

                      ),
                      ListTile(
                        onTap: (){
                          launchUrl(Uri.parse(data!.twitter.toString()));
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset(Assets.twiter,height: 30,width: 30,),
                        title:const Text("Twitter",
                          style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.textBlack,fontSize: 14),
                        ),

                      ),

                    ],
                  ),
                ),
               const SizedBox(height: 30,),



              ],
            ),
          );
        },
        )

    );
  }
}
