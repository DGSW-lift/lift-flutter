import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/common/widgets/circle_button.dart';
import 'package:lift/core/values/colors.dart' as colors;
import 'package:lift/domain/signup/view/signup_profile_picture.dart';
import 'package:lift/domain/signup/view/widget/signup_name/input_first_name_widget.dart';
import 'package:lift/domain/signup/view/widget/signup_name/input_last_name_widget.dart';
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';

class SignUpNameView extends StatefulWidget {
  const SignUpNameView({super.key});

  @override
  State<SignUpNameView> createState() => _SignUpNameViewState();
}

class _SignUpNameViewState extends State<SignUpNameView> {
  final _formkey = GlobalKey<FormState>();
  final _signUpVM = Get.put(SignupViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            children: [
              _enterNameText(),
              const SizedBox(height: 15),
              Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _lastNameTextField(),
                      const SizedBox(height: 10),
                      _firstNameTextField(),
                      const SizedBox(height: 10),
                    ],
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() => CircleButton(
          icon: const Icon(
            Icons.navigate_next,
            color: Colors.white,
          ),
          bgColor: _signUpVM.firstNameAvailable.value && _signUpVM.lastNameAvailable.value
              ? colors.accentColor
              : colors.accentColor.withOpacity(0.4),
          padding: 20,
          onTap: () {
            if(_formkey.currentState!.validate()){
              Get.to(
                () => const SignUpProfilePicture(),
                arguments: {
                  "firstName": _signUpVM.firstNameController.value.text,
                  "lastName": _signUpVM.lastNameController.value.text
                },
              );
            }
          })),
    );
  }

  Widget _firstNameTextField() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '이름', // 비밀번호 텍스트
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'NanumGothic',
                color: Color(0xff9B9B9B)),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 2),
          InputFirstNameWidget(),
          const SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _lastNameTextField() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '성', // 비밀번호 텍스트
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'NanumGothic',
                color: Color(0xff9B9B9B)),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 2),
          InputLastNameWidget(),
          const SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _enterNameText() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('이름을 알려주세요',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumGothicBold',
                  fontSize: 30),
              textAlign: TextAlign.left),
        ],
      ),
    );
  }

}
