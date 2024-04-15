
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/utils/utils.dart';
import 'package:lift/domain/signup/repository/signup_repository.dart';

class SignupViewModel extends GetxController {
  final SignUpRepository _api = SignUpRepositoryImpl();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;


  Rx<XFile?> profileImage = null.obs;
  RxBool loading = false.obs;
  RxBool emailAvailable = false.obs;
  RxBool passwordAvailable = false.obs;
  RxBool firstNameAvailable = false.obs;
  RxBool lastNameAvailable = false.obs;


  Future<bool> checkEmailDuplicate() async {
    loading.value = true;
    if (emailController.value.text.isEmpty) {
      loading.value = false;
      return false;
    }
    final email = emailController.value.text;
    ApiResponse response = await _api.checkEmailDuplicate(email);
    if(response.statusCode == HttpStatus.ok){
      loading.value = false;
      return true;
    }
    loading.value = false;
    Utils.snackBar('알림', '사용중인 이메일 주소입니다.');
    return false;
  }
}
