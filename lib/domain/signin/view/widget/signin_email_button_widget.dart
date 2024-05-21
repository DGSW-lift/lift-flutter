import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';
import 'package:lift/domain/main/view/main_view.dart';
import 'package:lift/domain/signin/view_model/controller/signin_view_model.dart';

class SignInEmailButtonWidget extends StatelessWidget {
  final formKey;

  SignInEmailButtonWidget({Key? key, required this.formKey}) : super(key: key);

  final signUpVM = Get.put(SigninViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => signUpVM.loading.value
        ? const Center(child: CircularProgressIndicator())
        : Container(
      width: double.infinity,
      height: 49,
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: ReusableButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            if(await signUpVM.signIn()){
              print("로그인 성공 : 200");

              Get.offAll(() => const MainView());
              // Get.to(() => const SignupPasswordView());
            }
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff4F60FE),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        text: '로그인',
        textStyle: const TextStyle(color: Colors.white),
      ),
    ));
  }


}
