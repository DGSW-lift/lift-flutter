import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/utils/utils.dart';
import 'package:lift/domain/signup/model/interest_response.dart';
import 'package:lift/domain/signup/model/signup_request.dart';
import 'package:lift/domain/signup/model/tag_item.dart';
import 'package:lift/domain/signup/repository/signup_repository.dart';
import 'package:textfield_tags/textfield_tags.dart';

class SignupViewModel extends GetxController {
  final SignUpRepository _api = SignUpRepositoryImpl();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final interestTagController = StringTagController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;

  Rx<File?> profileImage = Rxn<File>();
  RxBool loading = false.obs;
  RxBool emailAvailable = false.obs;
  RxBool passwordAvailable = false.obs;
  RxBool firstNameAvailable = false.obs;
  RxBool lastNameAvailable = false.obs;

  RxList<TagItem> tagList = <TagItem>[].obs;

  Future<bool> checkEmailDuplicate() async {
    loading.value = true;
    if (emailController.value.text.isEmpty) {
      loading.value = false;
      return false;
    }
    final email = emailController.value.text;
    ApiResponse response = await _api.checkEmailDuplicate(email);
    if (response.statusCode == HttpStatus.ok) {
      loading.value = false;
      return true;
    }
    loading.value = false;
    Utils.snackBar('알림', '사용중인 이메일 주소입니다.');
    return false;
  }

  Future<void> fetchInterest(String word) async {
    ApiResponse response = await _api.getFields(word);
    if (response.statusCode == HttpStatus.ok) {
      InterestResponse result = response.data;
      tagList.value = result.tags.map((tag) => TagItem(title: tag)).toList();
    }
  }

  Future<bool> signup() async {
    SignupRequest signupRequest = SignupRequest(
        email: emailController.value.text,
        password: passwordController.value.text,
        firstName: firstNameController.value.text,
        lastName: lastNameController
            .value.text,
        field: interestTagController.value.getTags! ?? []);
    ApiResponse response = await _api.signup(signupRequest, profileImage.value);
    if (response.statusCode == HttpStatus.created) {
      return true;
    }
    Utils.snackBar('알림', '회원가입 실패');
    return false;
  }
}
