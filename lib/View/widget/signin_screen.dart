import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/View/login/register_profile_picture.dart';
import 'package:lift/View/widget/resource/custom_appbar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _inputEmailTextField = TextEditingController();
  final _inputPasswordTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            _enterNameText(),
            const SizedBox(height: 20),
            InputEmailTextField(controller: _inputEmailTextField),
            const SizedBox(height: 10),
            InputPasswordTextField(controller: _inputPasswordTextField),
            const Spacer(),
            _nextButton()
          ],
        ),
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
          Text('이메일 로그인',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumGothicBold',
                  fontSize: 30),
              textAlign: TextAlign.left),
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
                () => const RegisterProfilePicture(),                
                arguments: {
                  "Email": _inputEmailTextField.text,
                  "Password": _inputPasswordTextField.text
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class InputEmailTextField extends StatefulWidget {
  const InputEmailTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<InputEmailTextField> createState() =>
      _InputEmailTextFieldState();
}

class _InputEmailTextFieldState extends State<InputEmailTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '이메일',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'NanumGothic',
                color: Color(0xff9B9B9B)),
            textAlign: TextAlign.left,
          ),
          TextField(
            style: const TextStyle(
                color: Color(0xffDADADA),
                fontSize: 15,
                fontFamily: 'NanumGothic'),
            controller: widget.controller,
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
              hintText: '이메일을 입력해주세요.',
            ),
          ),
        ],
      ),
    );
  }
}

class InputPasswordTextField extends StatefulWidget {
  const InputPasswordTextField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  State<InputPasswordTextField> createState() => _InputPasswordTextFieldState();
}

class _InputPasswordTextFieldState extends State<InputPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '비밀번호',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'NanumGothic',
                color: Color(0xff9B9B9B)),
            textAlign: TextAlign.left,
          ),
          TextField(
            style: const TextStyle(
                color: Color(0xffDADADA),
                fontSize: 15,
                fontFamily: 'NanumGothic'),
            controller: widget.controller,
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
            ),
          ),
        ],
      ),
    );
  }
}
