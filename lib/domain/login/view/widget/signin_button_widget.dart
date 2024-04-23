
import 'package:flutter/material.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';
import 'package:get/get.dart';
import 'package:lift/domain/signin/view/signin_select_view.dart';

class SigninButtonWidget extends StatelessWidget {

  const SigninButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ReusableButton(
      text: "LIFT 회원입니다",
      width: double.infinity,
      height: 50,
      style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xff4F60FE), width: 1.0)),
      textStyle: const TextStyle(
          fontSize: 15,
          color: Color(0xff4F60FE),
          fontFamily: 'NanumGothic'),
      onPressed:() {
        Get.to(
          () => const SignInSelectView()
        );
      } ,

    );
  }
}