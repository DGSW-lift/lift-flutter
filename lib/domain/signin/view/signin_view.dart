import 'package:flutter/material.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';
import 'package:lift/domain/signup/view/widget/signup_name/input_first_name_widget.dart';
import 'package:lift/domain/signup/view/widget/signup_name/input_last_name_widget.dart';


// 이메일 로그인 페이지
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            children: [
              _SignInText(),
              const SizedBox(height: 15),
              Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InputEmailTextField(),
                      const SizedBox(height: 10),
                      _InputPasswordTextField(),
                      const SizedBox(height: 30),
                      _SignInButton(),
                    ],
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _InputEmailTextField() {
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
          const SizedBox(height: 2),
          InputFirstNameWidget(),
          const SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _InputPasswordTextField() {
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
          const SizedBox(height: 2),
          InputLastNameWidget(),
          const SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _SignInText() {
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

  Widget _SignInButton() {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: ReusableButton(
      text: "로그인",
      width: double.infinity,
      height: 55,
      style: TextButton.styleFrom(
          backgroundColor: Color(0xff4F60FE),
          side: const BorderSide(color: Color(0xff4F60FE), width: 1.0)),
      textStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontFamily: 'NanumGothic'),
    )
    );
  }

}


