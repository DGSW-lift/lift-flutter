import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/utils/utils.dart';
import 'package:lift/domain/login/viewModel/validate_check.dart';
import 'package:lift/domain/signin/view_model/controller/signin_view_model.dart';

class InputPasswordWidget extends StatelessWidget {

  InputPasswordWidget({Key? key}) : super(key: key);
  final signinVM = Get.put(SigninViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: true,
        controller: signinVM.passwordController.value,
        focusNode: signinVM.passwordFocusNode.value,
        validator: (value) {
          if (value!.isEmpty) {
            Utils.snackBar('비밀번호', '비밀번호를 입력해주세요.');
          }
        },
        style: const TextStyle(fontSize: 15, fontFamily: 'NanumGothic'),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xff4F60FE),
                width: 2.0,
              )),
          contentPadding: const EdgeInsets.all(13),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xff4F60FE),
                width: 2.0,
              )),
          hintText: '비밀번호를 입력해주세요.',
        ));
  }
}

