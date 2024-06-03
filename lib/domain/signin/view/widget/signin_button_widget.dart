import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lift/domain/signin/view_model/controller/signin_view_model.dart';
import 'package:lift/domain/signup/view/signup_name.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';
import 'package:lift/domain/signup/view/signup_password_view.dart';
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';
import 'package:get/get.dart';

class SignInButtonWidget extends StatelessWidget {
  final formKey;

  SignInButtonWidget({Key? key, required this.formKey}) : super(key: key);

  final signUpVM = Get.put(SigninViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => signUpVM.loading.value
        ? const Center(child: CupertinoActivityIndicator())
        : Container(
            width: double.infinity,
            height: 49,
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: ReusableButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  // bool isAvailable = await signUpVM.checkEmailDuplicate();
                  // if(isAvailable){
                  //   Get.to(() => const SignupPasswordView());
                  // }
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
              text: '다음',
              textStyle: const TextStyle(color: Colors.white),
            ),
          ));
  }
}
