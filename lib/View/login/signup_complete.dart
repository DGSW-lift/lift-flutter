import 'package:flutter/material.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';

class SignUpComplete extends StatelessWidget {
  const SignUpComplete({super.key});

  @override
  Widget build(BuildContext context) {                                                                     
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('assets/images/SignUpCompleteImg.png'),
                width: MediaQuery.of(context).size.height * 0.3,
                height: MediaQuery.of(context).size.height * 0.3),
            const SizedBox(height: 20),
            const Text(
              '준비가 다 되었어요',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'NanumGothicBold',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              '이제 ‘공통 분야로 연결되는 사람들’과\n소통을 시작해볼까요?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'NanumGothic',
                color: Color(0xff898989),
              ),
            ),
            const SizedBox(height: 25),
            ReusableButton(
              text: "시작하기",
              width: 200,
              height: 60,
              style: TextButton.styleFrom(backgroundColor: Color(0xff4F60FE)),
              textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: 'NanumGothic'),
            ),
          ],
        ),
      ),
    );
  }
}
