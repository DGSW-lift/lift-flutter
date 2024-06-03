import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/utils/utils.dart';
import 'package:lift/domain/login/viewModel/validate_check.dart';
import 'package:lift/domain/signin/view_model/controller/signin_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({Key? key}) : super(key: key);

  final signinVM = Get.put(SigninViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: signinVM.emailController.value,
        focusNode: signinVM.emailFocusNode.value,
        validator: (value) {
          String? error = ValidateCheck.validateEmail(value!);
          if(error != null){
            Utils.snackBar('이메일', error ?? "");
          }
          // return error;
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
