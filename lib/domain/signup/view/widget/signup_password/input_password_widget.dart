import 'package:flutter/material.dart';
import 'package:lift/core/utils/utils.dart';
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';
import 'package:get/get.dart';

class InputPasswordWidget extends StatelessWidget {
  final formKey;

  InputPasswordWidget({Key? key, required this.formKey}) : super(key: key);
  final _loginVM = Get.put(SignupViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: true,
        controller: _loginVM.passwordController.value,
        focusNode: _loginVM.passwordFocusNode.value,
        validator: (value) {
          if (value!.isEmpty) {
            Utils.snackBar('비밀번호', '비밀번호를 입력해주세요.');
          }
        },
        onChanged: (value) {
          if (value.length >= 8 && formKey.currentState!.validate()) {
            _loginVM.passwordAvailable.value = true;
          } else {
            _loginVM.passwordAvailable.value = false;
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
