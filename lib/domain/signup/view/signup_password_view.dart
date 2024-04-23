import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/common/widgets/circle_button.dart';
import 'package:lift/domain/signup/view/signup_name.dart';
import 'package:lift/domain/signup/view/signup_view.dart';
import 'package:lift/domain/signup/view/widget/signup_password/input_password_widget.dart';
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';
import 'package:lift/core/values/colors.dart' as colors;

class SignupPasswordView extends StatefulWidget {
  const SignupPasswordView({super.key});

  @override
  State<SignupPasswordView> createState() => _SignupPasswordViewState();
}

class _SignupPasswordViewState extends State<SignupPasswordView> {
  final _formkey = GlobalKey<FormState>();
  final _signUpVM = Get.put(SignupViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(surfaceTintColor: Colors.white,),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            children: [
              _passwordSettingText(),
              const SizedBox(height: 15),
              Form(key: _formkey, child: _passwordTextField(_formkey)),
              // _nextButton()
            ],
          ),
        ),
      ),
      floatingActionButton:
          Obx(() =>
              CircleButton(
                  icon: const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                  bgColor: _signUpVM.passwordAvailable.value
                      ? colors.accentColor
                      : colors.accentColor.withOpacity(0.4),
                  padding: 20,
                  onTap: () {
                      if(_signUpVM.passwordAvailable.isTrue){
                        Get.to(const SignUpNameView());
                      }
                  })
          ),
    );
  }
}

Widget _passwordSettingText() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 20),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('비밀번호를 설정해주세요',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'NanumGothicBold',
                fontSize: 30),
            textAlign: TextAlign.left),
      ],
    ),
  );
}

Widget _passwordTextField(final formkey) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '비밀번호', // 비밀번호 텍스트
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'NanumGothic',
              color: Color(0xff9B9B9B)),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 2),
        InputPasswordWidget(formKey: formkey,),
        const SizedBox(height: 2),
        const Text(
          '최소 8자 이상 입력해주세요.',
          style: TextStyle(
              fontSize: 13,
              fontFamily: 'NuanumGothic',
              color: Color(0xff9B9B9B)),
          textAlign: TextAlign.left,
        ),
      ],
    ),
  );
}

Widget _nextButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: EdgeInsets.only(right: 20, bottom: 15),
        child: IconButton(
          icon: const Image(
              image: AssetImage('assets/images/NextButton.png'),
              height: 50,
              width: 50),
          onPressed: () {
            Get.to(
              () => const SignUpView(),
              // final String password =
            );
          },
        ),
      ),
    ],
  );
}
