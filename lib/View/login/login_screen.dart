import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';
import 'package:lift/View/login/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.13),
          const LiftLogoImg(),
          _liftTitle(),
          const LiftIntro(),
          const Spacer(),
          const LiftLoginButton(),
        ],
      ),
    );
  }
}

class LiftLogoImg extends StatelessWidget {
  const LiftLogoImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      alignment: Alignment.centerRight,
      child: Image(
        image: const AssetImage('assets/images/Lift_Logo.png'),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.height * 0.2,
      ),
    );
  }
}

Widget _liftTitle() {
  return Container(
    padding: const EdgeInsets.fromLTRB(20, 40, 0, 10),
    alignment: Alignment.centerLeft,
    child: const Column(
      children: [
        Text(
          "LIFT",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 40,
              fontFamily: 'NanumGothicBold',
              color: Color(0xff4F60FE)),
        )
      ],
    ),
  );
}

class LiftIntro extends StatelessWidget {
  const LiftIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          "업무와 연관된 다양한 사람들을 만나고\n새로운 기회를 발견하고 성장의 문을 열어주세요.\n지금 바로 시작해보세요!",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: Responsive_FontSize(context),
              color: Color(0xff9B9B9B),
              fontFamily: 'NanumGothic'),
    ));
  }
}

double Responsive_FontSize(BuildContext context) {
  if (MediaQuery.of(context).size.height > 700) {
    return 15;
  } else {
    return 12;
  }
}

class LiftLoginButton extends StatelessWidget {
  const LiftLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
      child: Column(
        children: [
          ReusableButton(
            text: "회원가입",
            width: double.infinity,
            height: 50,
            style: TextButton.styleFrom(backgroundColor: Color(0xff4F60FE)),
            textStyle: const TextStyle(
                fontSize: 15, color: Colors.white, fontFamily: 'NanumGothic'),
                onPressed: () {
              Get.to(
                () => const SignUpScreen(),
              );
            },
          ),
          const SizedBox(height: 10),
          ReusableButton(
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
          ),
        ],
      ),
    );
  }
}
