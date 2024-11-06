import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeController extends GetxController {
  // Method to update the selected date

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> currentDate = DateTime.now().obs;

  pickDate(BuildContext context) async {
    var date = DateTime.now(); // variable to store the selected date
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != date) {
      selectedDate.value = picked; // update the selected date
    }
    return selectedDate.value; // return the selected date
  }

  // Observable variables to hold month and year values
  var month = DateTime.now().month.obs;
  var year = DateTime.now().year.obs;

  // Method to get query string based on month and year values
  String get queryString => "?month=${month.value}&year=${year.value}";

  // Method to set custom month and year values
  void setDate(DateTime selectedDate) {
    month.value = selectedDate.month;
    year.value = selectedDate.year;
  }

  //current date
  String currentDate1() {
    return DateFormat("dd, MMM yyyy").format(DateTime.now());
  }



  String dateFormat1(DateTime date) {
    return DateFormat("dd, MMM yyyy").format(date);
  }
  String dateFormatDatabase(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }
}