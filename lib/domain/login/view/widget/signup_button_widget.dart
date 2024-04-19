
import 'package:flutter/material.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';
import 'package:get/get.dart';
import 'package:lift/domain/signup/view/signup_view.dart';

class SignupButtonWidget extends StatelessWidget {

  SignupButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ReusableButton(
      text: "회원가입",
      width: double.infinity,
      height: 50,
      style: TextButton.styleFrom(backgroundColor: Color(0xff4F60FE)),
      textStyle: const TextStyle(
          fontSize: 15, color: Colors.white, fontFamily: 'NanumGothic'),
      onPressed: () {
        Get.to(
              () => const SignUpView(),
        );
      },
    );
  }
}