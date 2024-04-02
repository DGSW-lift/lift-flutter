import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/View/login/register_profile_picture.dart';
import 'package:lift/View/widget/resource/custom_appbar.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  final _firstNameTextField = TextEditingController();
  final _nameTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            _enterNameText(),
            SizedBox(height: 20),
            EnterFirstNameTextField(controller: _firstNameTextField),
            SizedBox(height: 10),
            EnterNameTextField(controller: _nameTextField),
            Spacer(),
            _nextButton()
          ],
        ),
      ),
    );
  }

  Widget _enterNameText() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('이름을 알려주세요',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumGothicBold',
                  fontSize: 30),
              textAlign: TextAlign.left),
        ],
      ),
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20, bottom: 15),
          child: IconButton(
            icon: const Image(
                image: AssetImage('assets/images/NextButton.png'),
                height: 50,
                width: 50),
            onPressed: () {
              Get.to(
                () => RegisterProfilePicture(),
                arguments: {
                  "firstName": _firstNameTextField.text,
                  "lastName": _nameTextField.text
                },
              );
              print(_firstNameTextField.text);
            },
          ),
        ),
      ],
    );
  }
}

class EnterFirstNameTextField extends StatefulWidget {
  const EnterFirstNameTextField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  State<EnterFirstNameTextField> createState() =>
      _EnterFirstNameTextFieldState();
}

class _EnterFirstNameTextFieldState extends State<EnterFirstNameTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '성',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'NanumGothic',
                color: Color(0xff9B9B9B)),
            textAlign: TextAlign.left,
          ),
          TextField(
            style: const TextStyle(
                color: Color(0xffDADADA),
                fontSize: 15,
                fontFamily: 'NanumGothic'),
            controller: widget.controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xff4F60FE),
                    width: 2.0,
                  )),
              contentPadding: EdgeInsets.all(13),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xff4F60FE),
                    width: 2.0,
                  )),
              hintText: '성을 입력해주세요.',
            ),
          ),
        ],
      ),
    );
  }
}

class EnterNameTextField extends StatefulWidget {
  const EnterNameTextField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  State<EnterNameTextField> createState() => _EnterNameTextFieldState();
}

class _EnterNameTextFieldState extends State<EnterNameTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '이름',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'NanumGothic',
                color: Color(0xff9B9B9B)),
            textAlign: TextAlign.left,
          ),
          TextField(
            style: const TextStyle(
                color: Color(0xffDADADA),
                fontSize: 15,
                fontFamily: 'NanumGothic'),
            controller: widget.controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xff4F60FE),
                    width: 2.0,
                  )),
              contentPadding: EdgeInsets.all(13),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xff4F60FE),
                    width: 2.0,
                  )),
              hintText: '이름을 입력해주세요.',
            ),
          ),
        ],
      ),
    );
  }
}
