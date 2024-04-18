import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/utils/utils.dart';
import 'package:lift/domain/login/viewModel/validate_check.dart';
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(SignupViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: loginVM.emailController.value,
        focusNode: loginVM.emailFocusNode.value,
        validator: (value) {
          String? error = ValidateCheck.validateEmail(value!);
          return error;
        },
        style: const TextStyle(
            color: Colors.black, fontSize: 15, fontFamily: 'NanumGothic'),
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
              hintText: '이메일을 입력해주세요',
              errorStyle: const TextStyle(
              fontSize: 12.0,
              
        ),
    ));
  }
}
