import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lift/core/values/colors.dart' as colors;
class Utils {


  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode  nextFocus ){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  static toastMessage(String message){
    Fluttertoast.showToast(
      msg: message ,
      backgroundColor: colors.accentColor,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,


    );
  }


  static toastMessageCenter(String message){
    Fluttertoast.showToast(
      msg: message ,
      backgroundColor: colors.accentColor,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.white,
    );
  }

  static snackBar(String title, String message){
    Get.snackbar(
      title,
      message ,
    );
  }
}