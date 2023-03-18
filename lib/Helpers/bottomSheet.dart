import 'package:flutter/material.dart';
import 'package:foodcon/Services/imagePicker.dart';

empty(setFun) {
  setFun(() {});
}

bottomSheet(context, setFun) {
  return showModalBottomSheet(
      context: context,
      builder: ((context) {
        return Container(
          height: 120,
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.image,
                ),
                title: Text("Gallery"),
                onTap: () {
                  photofromGallery(setFun);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.camera,
                ),
                title: Text("Camera"),
                onTap: () {
                  photofromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }));
}
