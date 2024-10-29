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


//bottom sheet to choose images source
void chooseImageSource({ required BuildContext context, required VoidCallback onCamera, required VoidCallback onGallery}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 270,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text("Choose option",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: onCamera
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text("Gallery"),
              onTap: onGallery
            ),
          ],
        ),
      );
    },
  );
}
