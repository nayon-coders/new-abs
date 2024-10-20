import 'dart:convert';

import 'package:abs_office_management/app_config.dart';
import 'package:abs_office_management/data/services/api_services.dart';
import 'package:get/get.dart';
import '../../../data/model/contact_model.dart';

class ContactController extends GetxController{
  var customerContact = ContactModel().obs;
  var isLoading  = true.obs;

  @override
  void onInit() {
    super.onInit();
    getContact();

  }
  Future<void> getContact()async{
    try{
      isLoading(true);

      final res = await ApiServices.getApi(AppConfig.CONTACT_EMAIL_PHONE);


      if(res.statusCode == 200){
        final jsonData = jsonDecode(res.body);
        customerContact.value = ContactModel.fromJson(jsonData);
        print("contact get successfully");
        update();
      }else{
        print("contact get failed :${jsonDecode(res.body)["message"]}");

      }

    }catch(e){
      print(e);

    }finally{
      isLoading(false);
    }




  }

}