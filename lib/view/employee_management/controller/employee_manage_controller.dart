import 'dart:convert';
import 'dart:io';
import 'package:abs_office_management/main.dart';
import 'package:http/http.dart' as http;
import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:abs_office_management/data/model/employee_model/get_all_employee_model.dart';
import 'package:abs_office_management/data/model/employee_model/single_empolyee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/route_name.dart';




class EmployeeManageController extends GetxController{

  //selected image
  Rx<File?> selectedImage = Rx<File?>(null);
  final picker = ImagePicker();

  //TextEditing controller
  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> pass = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
  Rx<TextEditingController> type = TextEditingController().obs;
  Rx<TextEditingController> employeeType = TextEditingController().obs;
  Rx<TextEditingController> employeePosition = TextEditingController().obs;
  Rx<TextEditingController> salaryType = TextEditingController().obs;
  Rx<TextEditingController> salaryRate = TextEditingController().obs;

  //Employee Models
  Rx<EmployeeListModel> employeeListModel = EmployeeListModel().obs;
  Rx<SingleEmployeeModel> singleModel = SingleEmployeeModel().obs;

  RxString profileImage = "".obs;
  RxString selectEmployeeType = "".obs;
  RxString selectEmployeePosition = "".obs;
  RxString selectdId = "".obs;
  RxBool isForEdit = false.obs;
  var selectType= null;

  //Rx bool
  RxBool isGetting = false.obs;
  RxBool isLoading = false.obs;
  RxBool isDeleting = false.obs;
  RxBool isEditing = false.obs;
  RxString id = "".obs;


  @override
  onInit(){
    super.onInit();
    allEmployeeList();

  }

  pickImage(ImageSource source)async{
    isLoading.value = true;
    final picFile = await picker.pickImage(source: source,imageQuality: 80,preferredCameraDevice: CameraDevice.front);
    if(picFile != null){
      selectedImage.value = File(picFile.path);
      print("--image path : ${selectedImage.value!.path}");
      print("image selected successful");
    }else{
      print("Image selected failed");
    }
    isLoading.value = false;

  }



  //add employee Employee
  addEmployee()async{
    isLoading.value = true;

    SharedPreferences _pref = await SharedPreferences.getInstance();
    String? token = _pref.getString("token");

    final stream = http.ByteStream(selectedImage.value!.openRead());
    final length = await selectedImage.value!.length();
    if(selectedImage.value != null){
      final request = http.MultipartRequest(
        "PATCH",
        Uri.parse(AppConfig.CREATE_EMPLOYEE),
      );
      request.headers["Authorization"] = "Bearer $token";
      request.headers["Content-Type"] = "multipart/form-data ";

      final multipartFile = http.MultipartFile(
        "profilePic",
        stream,
        length,
        filename: selectedImage.value!.path.split("/").last,
      );

      final data ={
        "name": name.value.text,
        "email": email.value.text,
        "password": pass.value.text,
        "phone": phone.value.text,
        "type": type.value.text,
        "employeeType" : employeeType.value.text,
        "employeePosition" : employeePosition.value.text,
        "salaryType": salaryType.value.text,
        "salaryRate": salaryRate.value.text,

      };
      request.files.add(multipartFile);
      request.fields.addAll(data);

      final response = await request.send();
      final res = await http.Response.fromStream(response);
      if(res.statusCode == 200){
        clearTextEditingController();
        allEmployeeList();
        print("add employee successful");
        Get.snackbar("Success", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.green,colorText: Colors.white);
        Get.offNamed(AppRoute.employeeManageScree);
      }else{
        print("---error body :${jsonDecode(res.body)}");
        Get.snackbar("failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red,colorText: Colors.white);
        print("Status code:${res.statusCode}");
      }
    }

    isLoading.value = false;
  }



  //Get all Employee List
  allEmployeeList()async{
    isGetting.value = true;
    final res = await ApiServices.getApi(AppConfig.ALL_EMPLOYEE);

    if(res.statusCode == 200){
      print("Employee get Success");
      employeeListModel.value =employeeListModelFromJson(res.body);
    }else{
      print("failed:${jsonDecode(res.body)["message"]}");
    }
    isGetting.value = false;

  }



  //single Employee
  getSingleEmployee(id)async{
    isGetting.value = true;
    final res = await ApiServices.getApi(AppConfig.SINGLE_EMPLOYEE+id);
    if(res.statusCode ==200){
      singleModel.value = singleEmployeeModelFromJson(res.body);
      print("Single Employee get successful");
    }else{
      print("Failed :${jsonDecode(res.body)}");
    }
    isGetting.value = false;

  }


  //Edit Employee
   editEmployee()async{
     isLoading.value = true;
    var header = {
      "Accept" : "application/json",
      "Authorization" : "Bearer ${sharedPreferences!.getString("token")}"
    };
    final url = Uri.parse(AppConfig.EDIT_EMPLOYEE+selectdId.value);
    final request = http.MultipartRequest("PUT",url);
    if(profileImage.value!.isNotEmpty){
      if(selectedImage.value != null) { 
        final imageFile = await http.MultipartFile.fromPath(
          "profilePic",
          selectedImage.value!.path,
        );
        request.files.add(imageFile);

      }
    }


      final dataFields ={

        "name": name.value.text,
        "email": email.value.text,
        "password": pass.value.text,
        "phone": phone.value.text,
        "type": type.value.text,
        "employeeType" : employeeType.value.text,
        "employeePosition" : employeePosition.value.text,
        "salaryType": salaryType.value.text,
        "salaryRate": salaryRate.value.text,

      };
    //header added ]
      request.headers.addAll(header);
      request.fields.addAll(dataFields);
      var response = await request.send();

      print("Response --- ${response.statusCode}");
      if(response.statusCode == 200){

        getSingleEmployee(selectdId.value);
        clearTextEditingController();
        allEmployeeList();
        Get.back();

        Get.snackbar("Successful", "Employee update successful", backgroundColor: Colors.green,colorText: Colors.white);
      }else{
        Get.snackbar("Failed", "Update employee failed! StatusCode: ${response.statusCode}", backgroundColor: Colors.red,colorText: Colors.white);
        print(response.statusCode);
      }

    isLoading.value = false;

   }
  //set data for edit
  setEditValu(SingleEmployeeModel data){
    isForEdit.value = true;
    selectdId.value = data.employee!.id.toString();
    name.value.text = data.employee!.name!.toString();
    email.value.text = data.employee!.email!.toString();
    phone.value.text = data.employee!.phone!.toString();
    type.value.text = data.employee!.type.toString();
    salaryRate.value.text = data.employee!.salaryRate.toString();
    salaryType.value.text = data.employee!.salaryType.toString();
    employeeType.value.text = data.employee!.employeeType.toString();
    employeePosition.value.text = data.employee!.employeePosition.toString();
    profileImage.value = data.employee!.profilePic.toString();

    Get.toNamed(AppRoute.addEmployeeScreen);



  }


  //delete employee
  deleteEmployee(id)async{
    isDeleting.value = true;
    final res = await ApiServices.deleteApi("${AppConfig.DELETE_EMPLOYEE}$id");
    if(res.statusCode == 200){
      allEmployeeList();
      Get.offAllNamed(AppRoute.employeeManageScree);
      Get.snackbar("Successful", "Delete Successful",backgroundColor: Colors.green,colorText: Colors.white);

    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.red,colorText: Colors.white);
    }
    isDeleting.value = false;

  }





  clearTextEditingController(){
    isForEdit.value = false;
    name.value.clear();
    email.value.clear();
    phone.value.clear();
    type.value.clear();
    employeePosition.value.clear();
    employeeType.value.clear();
    salaryRate.value.clear();
    salaryType.value.clear();
    pass.value.clear();
    selectedImage.value = null;
    profileImage.value = "";
    singleModel.value = SingleEmployeeModel();
    update();

  }
}