import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/View/login/login_screen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async{
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

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}
