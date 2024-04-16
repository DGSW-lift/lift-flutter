import 'dart:async';
import 'package:get/get.dart';
import 'package:lift/View/login/signup_complete.dart';
import 'package:lift/domain/login/view/login_view.dart';

class SplashService {
  void isLogin() {
    Timer(const Duration(seconds: 2), () => Get.offAll(const SignUpComplete()));
  }
}
