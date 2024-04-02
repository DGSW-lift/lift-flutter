import 'package:flutter/material.dart';
import 'package:lift/View/login/enter_name_screen.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';
import 'package:lift/View/widget/resource/reusable_checkBox.dart';
import 'package:get/get.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Image(
                image: AssetImage('assets/images/BackButton.png'),
                height: 22,
                width: 12
              ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    ),
    body: Column(
      children: [
        _signUpText(),
        const SizedBox(height: 30),
        _emailTextField(),
        const SizedBox(height: 10),
        _nextButton(context),
        const SizedBox(height: 10),
        _orText(),
        const SizedBox(height: 12),
        const SocialLoginButton(),
        const SizedBox(height: 20),
        const TermOfUseTextarea(),
      ],
    ),
    );
  }
}

Widget _signUpText() {
  return Container(
    width: double.infinity,
     padding: const EdgeInsets.only(left: 20),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("회원 가입",
        style: TextStyle(
        fontWeight:FontWeight.bold,fontFamily: 'NanumGothicBold',fontSize: 40),textAlign: TextAlign.left),
        SizedBox(height: 20,),
        Opacity(opacity: 0.2,
        child: Text("만 14세 미만은 가입할 수 없습니다.",
        style: TextStyle(fontFamily: 'NanumGothic',fontSize: 15),textAlign: TextAlign.left)), 
      ],
    ),
  );
}

Widget _emailTextField() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('이메일',
          style: TextStyle(fontSize: 15,fontFamily: 'NanumGothic',color: Color(0xff9B9B9B)),
          textAlign: TextAlign.left,
          ),
          TextField(
            style: const TextStyle(color: Color(0xffDADADA),fontSize: 15,fontFamily: 'NanumGothic'),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff4F60FE),
                  width: 2.0,
                )
              ),
              contentPadding: EdgeInsets.all(13),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff4F60FE),
                  width: 2.0,
                )),
              hintText: '이메일을 입력해주세요',
            ),
          )
        ],
      ),
  );
}

Widget _nextButton(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 49,
    padding: const EdgeInsets.only(left: 18, right: 18),
    child: ReusableButton(
      onPressed: () {
        Get.to(() => const EnterNameScreen());
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
  );
}

Widget _orText() {
  return const Text(
    '또는',
    style: TextStyle(fontSize: 12, 
    fontFamily: 'NanumGothicBold',
    color: Color(0xff898989)
    ),
  );
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage('assets/images/Login_apple.png')),
        SizedBox(height: 50,width: 10),
        Image(image: AssetImage('assets/images/Login_google.png')),
      ],
    );
  }
}

class TermOfUseTextarea extends StatefulWidget {
  const TermOfUseTextarea({super.key});

  @override
  State<TermOfUseTextarea> createState() => _TermOfUseTextareaState();
}

class _TermOfUseTextareaState extends State<TermOfUseTextarea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('서비스 약관 동의',
          style: TextStyle(fontSize: 15,fontFamily: 'NanumGothic'),
          textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ReuseableCheckbox(),
              SizedBox(width: 20,height: 20),
              Text('이용약관 동의'),
              Spacer(),
              TextButton(onPressed: null, child: Text('보기'))
            ],
          ),
          Row(
            children: [
              ReuseableCheckbox(),
              SizedBox(width: 20,height: 35),
              Text('개인정보취급방침 동의'),
              Spacer(),
              TextButton(onPressed: null, child: Text('보기'))
            ],
          ),        
        ],
      ),
    );
  }
}