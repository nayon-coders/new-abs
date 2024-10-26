import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

///------- role --------//

String adminRole = "admin";
String managerRole = "Manager";
String partner = "Partner";

alertDialog({
  required String title,
  required String content,
  required VoidCallback onOk,
}){
  return Get.defaultDialog(
    title: title,
    content:  Text("$content"),
    actions: [
      TextButton(
        onPressed: onOk,
        child: const Text("YES"),
      ),
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("NO"),
      ),
    ],
  );
}



// Method to update the selected date
 pickDate(BuildContext context) async {
  var selectedDate = DateTime.now(); // variable to store the selected date
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
  }
  return selectedDate; // return the selected date
}

dateFormat1(DateTime date) {
  return DateFormat("dd, MMM yyyy").format(date);
}