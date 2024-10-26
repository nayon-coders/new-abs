import 'dart:ui';

import 'package:flutter/material.dart';

class SelectPicker {

  //chose image pic option gallery and camera
  static  showImageBottomSheet({
    required BuildContext context,
    required VoidCallback onCamera,
    required VoidCallback onGallery
  }) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Choose an option",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
              ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text('Camera'),
                  onTap: onCamera
              ),
              ListTile(
                  leading: new Icon(Icons.photo),
                  title: new Text('Gallery'),
                  onTap: onGallery
              ),

            ],
          ),
        );
      },
    );
  }

}