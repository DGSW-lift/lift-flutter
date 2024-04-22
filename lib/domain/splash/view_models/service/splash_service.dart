import 'dart:async';
import 'package:get/get.dart';
import 'package:lift/domain/login/view/login_view.dart';
import 'package:lift/domain/signin/view/signin_select_view.dart';

class SplashService {
  void isLogin() {
    Timer(const Duration(seconds: 2), () => Get.offAll(const SignInSelectView()));

  }
}
