
import 'dart:math';
import 'package:abs_office_management/view/employee_management/controller/employee_manage_controller.dart';
import 'package:abs_office_management/view/settings/controller/employee_position_controller.dart';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:abs_office_management/widgets/selected_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/route_name.dart';
import '../../../utility/app_color.dart';
import '../../../widgets/app_input.dart';
import '../../../widgets/app_shimmer.dart';
import '../../../widgets/custom_dropdown.dart';

class AddEmployee extends GetView<EmployeeManageController> {
   AddEmployee({super.key,});

  // Employee Role
  String? selectType;

  final List<String> employeeType = [
    "Employee",
    'Manager',
  ];

  final positionController = Get.put(EmployeePositionController());
  //Employee Position
  String? selectEmployeePosition;

  final List<String> employeePosition = [
    'Manager',
    'Operator',
  ];

  //Employee Type
  String? selectEmployeeType;

  final List<String> employee_Type = [
    'Part-time',
    'Full-time',
  ];

  //SalaryType
  String? seletedSalaryType;

  final List<String> salaryType = [
    'Hourly',
    'Daily',
    'Weekly',
    'Monthly',
  ];


  final _key = GlobalKey<FormState>();

  bool readOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,

      appBar: AppBar(
        backgroundColor: AppColors.textWhite,
        surfaceTintColor: Colors.transparent,

        title:const Text(
          "ADD NEW EMPLOYEE",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlack),
        ),

        leading: Padding(
          padding: const EdgeInsets.all(10.0),

          child: IconButton(
              onPressed: ()=>Get.toNamed(AppRoute.employeeManageScree),
              icon:const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: AppColors.textBlack,
              )),
        ),
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(15),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // //image update
              Obx(() {
                return Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.textWhite,
                        ),

                        //jodi selectImage null na hoi thahole image show korabe null hole icon show korabe
                        child:Center(
                          child: (controller.selectedImage.value != null)
                              ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  controller.selectedImage.value!,
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              )                              : const Icon(
                            Icons.image_outlined,
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 1,
                          bottom: 10,
                          child: InkWell(
                            onTap: (){

                              //select image camera or gallery
                              SelectPicker.showImageBottomSheet(
                                  context: context,
                                  onCamera: (){
                                    controller.pickImage(ImageSource.camera);
                                    Get.back();
                                  },
                                  onGallery: (){
                                    controller.pickImage(ImageSource.gallery);
                                    Get.back();
                                  });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration:const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey
                              ),
                              child: const Icon(Icons.camera_alt,color: Colors.white,size: 18,),
                            ),
                      ))
                    ],
                  ),


                );
              }),

              const SizedBox(height: 20,),

              //TextField employee name
              const Text(
                "Employee Name",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textBlack),
              ),

              const SizedBox(height: 10,),
              AppInput(
                hint: "Name",
                fillColor: AppColors.textWhite,
                textType: TextInputType.name,
                controller: controller.name.value,
               ),
              const SizedBox(height: 20,),


              //Email
              const Text(
                "Employee Email",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textBlack),
              ),
            const  SizedBox(
                height: 10,
              ),
              AppInput(
                textType: TextInputType.emailAddress,
                hint: "Email",
                fillColor: AppColors.textWhite,
                controller: controller.email.value,
              ),
              const SizedBox(
                height: 20,
              ),


              //phone Number
             const Text(
                "Employee Phone Number",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textBlack),
              ),
             const SizedBox(
                height: 10,
              ),
              AppInput(
                hint: "Phone Number",
                fillColor: AppColors.textWhite,
                textType: TextInputType.number,
                controller: controller.phone.value,
                ),
              const SizedBox(
                height: 20,
              ),


              //Employee Role Dropdown
             const  Text(
                "Role",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textBlack),
              ),
             const SizedBox(
                height: 10,
              ),
              CustomDropDown(
                  fillColor: AppColors.textWhite,
                  items: employeeType,
                  hint: "Employee Role",

                  onChange: (v) {
                    controller.type.value.text = v!;

                  }),
              const SizedBox(
                height: 20,
              ),





              //Employee type Dropdown
              const Text(
                "Employee Type",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textBlack),
              ),

              const SizedBox(
                height: 10,
              ),
              CustomDropDown(
                  fillColor: AppColors.textWhite,
                  items: employee_Type,
                  hint:"Employee Type",

                  onChange: (v) {
                    controller.employeeType.value.text = v!;
                  }),


              const SizedBox(height: 20,),

              //Employee Position Dropdown
             const Text(
                "Employee Position",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textBlack),
              ),
              const SizedBox(
                height: 10,
              ),

              Obx(() {
                if (positionController.isGetting.value) {
                  return Center(child: buildLoading());
                }

                // Error handling or empty state
                if (positionController.positionModel.value.data == null) {
                  return const Text("No positions available");
                }
                  return  CustomDropDown(
                      fillColor: AppColors.textWhite,
                      items:positionController.positionModel.value.data!.map((position){
                        return  position.name ?? "Unknown";
                      }).toList(),
                      //items: employeePosition,
                      hint:"Employee Position",

                      onChange: (v) {
                        controller.employeePosition.value.text = v!;
                      });
                }
              ),

             const SizedBox(
                height: 20,
              ),



              //Employee salary type dropdown
              const Text(
                "Employee Salary Type",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textBlack),
              ),
              const SizedBox(
                height: 10,
              ),

              //Dropdown
              CustomDropDown(
                  fillColor: AppColors.textWhite,
                  items: salaryType,
                  hint: seletedSalaryType ?? "Employee Salary Type",
                  onChange: (v) {
                    controller.salaryType.value.text = v!;
                  }),
             const SizedBox(
                height: 20,
              ),



              //TextField salary rate
             const Text(
                "Employee Salary Rate",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textBlack),
              ),
             const SizedBox(
                height: 10,
              ),
              AppInput(
                fillColor: AppColors.textWhite,
                textType: TextInputType.number,
                hint: "\$ 0.000",
                controller: controller.salaryRate.value,

              ),
              const SizedBox(height: 20,),




              const SizedBox(height: 50,),


              Obx(() {
                  return Center(child: AppButton(
                    isLoading: controller.isLoading.value,
                      name: "Add Employee",
                      onClick: (){
                        var password = Random().nextInt(99999999).toString();
                        controller.pass.value.text =password;
                      if(_key.currentState!.validate()){
                        if(controller.isEditing.value){
                          controller.editEmployee(controller.id.value);
                        }else{
                          controller.addEmployee();
                        }


                      }

                      }));
                }
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

   //loading shimmer
   Widget buildLoading() {
     return ListView.builder(
       shrinkWrap: true,
       itemCount: 10,
       itemBuilder: (context,index){
         return AppShimmerPro.circularShimmer(width: double.infinity, height: 30, borderRadius: 10);
       },
     );
   }
}
