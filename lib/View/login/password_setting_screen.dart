import 'package:flutter/material.dart';
import 'package:lift/View/widget/resource/custom_appbar.dart';

class PasswordSettingScreen extends StatefulWidget {
  const PasswordSettingScreen({super.key});

  @override
  State<PasswordSettingScreen> createState() => _PasswordSettingScreenState();
}

class _PasswordSettingScreenState extends State<PasswordSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            _passwordSettingText(),
            _passwordTextField(),
            Spacer(),
            _nextButton()
          ],
        ),
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
        fontWeight:FontWeight.bold,fontFamily: 'NanumGothicBold',fontSize: 30),textAlign: TextAlign.left),
      ],
    ),
  );
}

Widget _passwordTextField() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('비밀번호', // 비밀번호 텍스트
          style: TextStyle(fontSize: 15,fontFamily: 'NanumGothic',color: Color(0xff9B9B9B)),
          textAlign: TextAlign.left,
          ),
          TextField( // 비밀번호 텍스트 필드
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
              hintText: '비밀번호를 입력해주세요.',
            ),
          ),
          const Text('최소 8자 이상 입력해주세요.', 
          style: TextStyle(fontSize: 13,fontFamily: 'NuanumGothic',color: Color(0xff9B9B9B)),
          textAlign: TextAlign.left,
          ),
        ],
      ),
  );
}

Widget _nextButton() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: EdgeInsets.only(right: 20,bottom: 15),
        child: Image(
          image: AssetImage('assets/images/NextButton.png'),
          width: 50,
          height: 50,
        ),
      ),
    ],
  );
}
