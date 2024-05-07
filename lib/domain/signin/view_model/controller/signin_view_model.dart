import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/common/models/authentication.dart';
import 'package:lift/core/helpers/token_storage_helper.dart';
import 'package:lift/core/utils/utils.dart';
import 'package:lift/domain/signin/model/signin_request.dart';
import 'package:lift/domain/signin/repository/signin_repository.dart';

class SigninViewModel extends GetxController {

  final SignInRepository _api = SignInRepositoryImpl();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool emailAvailable = false.obs;
  RxBool passwordAvailable = false.obs;

  RxBool loading = false.obs;

  Future<bool> signIn() async {
    loading.value = true;
    if (emailController.value.text.isEmpty) {
      loading.value = false;
      Utils.snackBar('알림', '이메일을 입력해주세요.');
      return false;
    }
    if (passwordController.value.text.isEmpty) {
      loading.value = false;
      Utils.snackBar('알림', '비밀번호를 입력해주세요.');
      return false;
    }
    final email = emailController.value.text;
    final password = passwordController.value.text;

    ApiResponse response = await _api.signIn(SignInRequest(email: email, password: password));
    if (response.statusCode == HttpStatus.ok) {
      loading.value = false;
      Authentication authentication = response.data;
      await TokenStorage().save(authentication);
      return true;
    }
    Utils.snackBar('알림', '이메일 또는 비밀번호를 확인해주세요.');
    loading.value = false;
    return false;
  }

}