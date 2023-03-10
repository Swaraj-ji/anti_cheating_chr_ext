import 'dart:html';

import 'package:firebase_storage_web/firebase_storage_web.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:anti_cheating/frontend/camera_utils.dart';
import 'package:cross_file/cross_file.dart';
import 'package:cross_file_image/cross_file_image.dart';

class UploadImage {
  final String subFolder;
  UploadImage({required this.subFolder});

  Future<void> capPicture() async {
    var image;
    try {
      // Ensure that the camera is initialized.
      // await _initializeControllerFuture;

      // Attempt to take a picture and then get the location
      // where the image file is saved.
      image = await controller.takePicture();
      String imagePath = image.path;

      print("image.path======================================$imagePath");
      // upload(imagePath);
    } catch (e) {
      // If an error occurs, log the error to the console.
      print("$e------------------------Capture-------------------");
    }
    final storageRef =
        FirebaseStorageWeb(bucket: "gs://anti-cheating-chrome-ext.appspot.com");
    final imageRef = storageRef.ref("$subFolder/test_image.jpg");
    // String dataUrl = imagePath;
    // print("$imagePath----------------------------Image path-------------");
    try {
      // await imageRef.putBlob(image.path);
      await imageRef.putData(await image.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      // await mountainsRef.putString(dataUrl, format: PutStringFormat.dataUrl);
    } on FirebaseException catch (e) {
      // ...
      print("$e------------------Upload Exc-------------------------");
    }
  }

  // Future<void> upload(String imagePath) async {
  //   print("inside upload 1--------------------------------");
  //
  //   final storageRef =
  //       FirebaseStorageWeb(bucket: "gs://anti-cheating-chrome-ext.appspot.com");
  //   final imageRef = storageRef.ref("$subFolder/test_image.jpg");
  //   // final mountainsRef = storageRef.child(subFolder);
  //   //
  //   // final mountainImagesRef = storageRef.child("$subFolder/test_image.jpg");
  //
  //   // assert(mountainsRef.name == mountainImagesRef.name);
  //   // assert(mountainsRef.fullPath != mountainImagesRef.fullPath);
  //   String dataUrl = imagePath;
  //   print("$imagePath----------------------------Image path-------------");
  //   try {
  //     await imageRef.putFile(imagePath);
  //     // await imageRef.putString(imagePath, PutStringFormat.dataUrl);
  //     // await mountainsRef.putString(dataUrl, format: PutStringFormat.dataUrl);
  //   } on FirebaseException catch (e) {
  //     // ...
  //     print("$e------------------Upload Exc-------------------------");
  //   }
  // }
}
