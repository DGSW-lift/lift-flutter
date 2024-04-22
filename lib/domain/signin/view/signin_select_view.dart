import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';
import 'package:lift/domain/signin/view/widget/reusable_image_login_button.dart';

class SignInSelectView extends StatelessWidget {
  const SignInSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            _SelectLoginText(),
            const SizedBox(height: 10),
            _SelectLoginSubText(),
            const SizedBox(height: 50),
            _EmailLoginButton(),
            const SizedBox(height: 10),
            _GoogleLoginButton(),
            const SizedBox(height: 10),
            _AppleLoginButton(),
          ],
        )),
      ),
    );
  }

  Widget _SelectLoginText() {
    return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 20),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('안녕하세요\nLIFT입니다',
        style: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'NanumGothic',
        fontSize: 40),
        textAlign: TextAlign.left),
      ],
    ),
  );
}

Widget _SelectLoginSubText() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: const Opacity(
        opacity: 0.2,
        child: Text("회원 서비스 사용을 위해 로그인해주세요",
            style: TextStyle(fontFamily: 'NanumGothic', fontSize: 15),
            textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

Widget _EmailLoginButton() {
  return Container(
    padding: const EdgeInsets.only(left: 20,right: 20),
    child: ReusableButton(
    width: double.infinity,
    height: 40,
    onPressed: () async {
      print('안농');
    },
    style: TextButton.styleFrom(
      side: const BorderSide(color: Colors.black, width: 1.5),
      backgroundColor: const Color(0xff4F60FE),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    text: '이메일 로그인',
    textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
  ),
  );
}


Widget _AppleLoginButton() {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    height: 40,
    child: ReusableImageLoginButton(
      imagePath: 'assets/images/remove_background_Login_apple.png',
      text: '애플 로그인',
      onPressed: () {
        print('안녕');
      },
    ),
  );
}

Widget _GoogleLoginButton() {
  return Container(
    height: 40,
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: ReusableImageLoginButton(
      imagePath: 'assets/images/remove_background_Login_google.png',
      text: '구글 로그인',
      onPressed: () {
        print('안녕');
      },
    ),
  );
}
