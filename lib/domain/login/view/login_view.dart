import 'package:flutter/material.dart';

import 'package:lift/View/widget/resource/reusable_button.dart';
import 'package:lift/domain/signup/view/signup_view.dart';
import 'package:lift/domain/login/view/widget/signin_button_widget.dart';
import 'package:lift/domain/login/view/widget/signup_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.13),
          _liftLogoImg(context),
          _liftTitle(),
          _liftIntro(context),
          const Spacer(),
          const LiftLoginButton(),
        ],
      ),
    );
  }
}

_liftLogoImg(BuildContext context) {
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

_liftIntro(BuildContext context) {
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
         SignupButtonWidget(),
          const SizedBox(height: 10),
          SigninButtonWidget(),
        ],
      ),
    );
  }
}
