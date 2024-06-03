import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/common/service/member_profile_service.dart';
import 'package:lift/core/main_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
   await dotenv.load(fileName: 'Server_URL.env');
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
  runApp(const MainApp());
  
  var isCameraGranted = await requestCameraPermission();
  if (!isCameraGranted) {
    return;
  }

  var isPhotosGranted = await requestPhotosPermission();
  if (!isPhotosGranted) {
    return;
  }
}

Future<bool> requestCameraPermission() async {
  var status = await Permission.camera.status;
  if (status.isGranted) {
    return true;
  } else {
    var result = await Permission.camera.request();
    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}

Future<bool> requestPhotosPermission() async {
  var status = await Permission.photos.status;
  if (status.isGranted) {
    return true;
  } else {
    var result = await Permission.photos.request();
    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}

