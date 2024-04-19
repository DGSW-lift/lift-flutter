import 'package:flutter/material.dart';
import 'package:lift/View/widget/resource/reusable_button.dart';

class SignInSelectView extends StatelessWidget {
  const SignInSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
        child: Column(
          children: [

          ],
        )),
      ),
    );
  }

  Widget SelectLoginText() {
    return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 20),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('안녕하세요\nLIFT입나다',
        style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'NanumGothicBold',
        fontSize: 40),
        textAlign: TextAlign.left),
      ],
    ),
  );
}

  Widget SelectLoginSubText() {
    return Container(
     width: double.infinity,
     padding: EdgeInsets.only(left: 20,right: 20),
     
    );
  }
}

