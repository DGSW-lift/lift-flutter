import 'package:flutter/material.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';
import 'package:lift/domain/login/view/login_view.dart';
import 'package:get/get.dart';

class SignUpCompleteView extends StatefulWidget {
  const SignUpCompleteView({super.key});

  @override
  State<SignUpCompleteView> createState() => _SignUpCompleteViewState();
}

class _SignUpCompleteViewState extends State<SignUpCompleteView> {

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formkey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _liftLogoImg(context),
            const SizedBox(height: 20,),
            const Text('준비가 다 되었어요',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NanumGothicBold',
                    fontSize: 35),
                textAlign: TextAlign.center),
            const SizedBox(height: 20,),
            const Text('이제 \'공통 분야로 연결되는 사람들\'과\n소통을 시작해볼까요?',
                style: TextStyle(
                    color: Color(0xff898989),
                    fontFamily: 'NanumGothicBold',
                    fontSize: 15),
                textAlign: TextAlign.center),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 49,
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: ReusableButton(
                onPressed: () async {
                  Get.offAll(() => const LoginView());
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff4F60FE),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                text: '시작하기',
                textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }

  _liftLogoImg(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image(
        image: const AssetImage('assets/images/SignUpCompleteImg.png'),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.height * 0.3,
      ),
    );
  }
}