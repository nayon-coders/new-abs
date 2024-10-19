import 'dart:io';
import 'dart:math';
import 'package:abs_office_management/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';
import '../../../widgets/app_input.dart';
import '../../../widgets/custom_dropdown.dart';

class AddEmployee extends StatelessWidget {
   AddEmployee({super.key,});

  // Employee Role
  String? selectType;

  final List<String> employeeType = [
    "Employee",
    'Manager',
  ];

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

  final _name = TextEditingController();

  final _phone = TextEditingController();

  final _email = TextEditingController();

  final _salary = TextEditingController();

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
              onPressed: ()=>Get.back(),
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
                controller: _name, readOnly: readOnly,),
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
                controller: _email,
                readOnly: readOnly,),
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
                controller: _phone, readOnly: readOnly,),
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

                  onChange: (v) {}),


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

              CustomDropDown(
                  fillColor: AppColors.textWhite,
                  //items: employeePosition.map((PositionData) => PositionData.name ?? "Unknown").toList(),
                  items: employeePosition,
                  hint:"Employee Position",

                  onChange: (v) {
                  }),

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
                  onChange: (v) {}),
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
                controller: _salary,  readOnly: readOnly,),
              const SizedBox(height: 20,),


              //image update
              Center(
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    height: 150,
                    width: MediaQuery.sizeOf(context).width*0.60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.textWhite,
                    ),
                    child:const Icon(
                      Icons.image_outlined,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),


              ),

              const SizedBox(height: 50,),


              Center(child: AppButton(name: "Add Employee", onClick: (){})),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
