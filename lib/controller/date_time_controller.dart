import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeController extends GetxController {
  // Method to update the selected date

  Rx<DateTime> selectedDate = DateTime.now().obs;

  pickDate(BuildContext context) async {
    var date = DateTime.now(); // variable to store the selected date
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != date) {
      selectedDate.value = picked!; // update the selected date
    }
    return selectedDate.value; // return the selected date
  }

  String dateFormat1(DateTime date) {
    return DateFormat("dd, MMM yyyy").format(date);
  }
  String dateFormatDatabase(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }
}