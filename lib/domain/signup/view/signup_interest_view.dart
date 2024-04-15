
import 'package:flutter/material.dart';
import 'package:lift/core/common/widgets/circle_button.dart';
import 'package:lift/core/values/colors.dart' as colors;
import 'package:get/get.dart';

class SignupInterestView extends StatefulWidget {
  const SignupInterestView({super.key});

  @override
  State<SignupInterestView> createState() => _SignupInterestViewState();
}

class _SignupInterestViewState extends State<SignupInterestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Column(
              children: [
                _interestText()
              ],
            ),
          ),
        ),
        floatingActionButton: CircleButton(
            icon: const Icon(
              Icons.navigate_next,
              color: Colors.white,
            ),
            bgColor: colors.accentColor,
            padding: 20,
            onTap: () {
              // Get.to(const SignupInterestView());
            }));
  }

  Widget _interestText() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('활동분야를',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumGothicBold',
                  fontSize: 30),
              textAlign: TextAlign.left),
          Text('선택해 주세요',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumGothicBold',
                  fontSize: 30),
              textAlign: TextAlign.left),
        ],
      ),
    );
  }

}